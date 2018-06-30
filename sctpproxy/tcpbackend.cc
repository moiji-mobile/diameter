#include "tcpbackend.h"
#include "backendmanager.h"
#include "frame.h"

#include <event2/buffer.h>

TCPBackend::TCPBackend(BackendManager* manager, event_base* base, int fd)
    : manager_(manager)
    , buffer_(bufferevent_socket_new(base, fd, BEV_OPT_CLOSE_ON_FREE)) {

    bufferevent_setcb(buffer_.get(), data_cb, nullptr, event_cb, this);
    bufferevent_enable(buffer_.get(), EV_READ);
}

void TCPBackend::data_cb(bufferevent*, void* ptr) {
    auto that = (TCPBackend *) ptr;
    that->on_data();
}

void TCPBackend::on_data() {
    struct sctp_proxy_frame *frame;
    auto buf = bufferevent_get_input(buffer_.get());

    frame = reinterpret_cast<sctp_proxy_frame*>(evbuffer_pullup(buf, sizeof(*frame)));
    if (!frame)
        return;

    auto data = evbuffer_pullup(buf, ntohs(frame->length));
    if (!data)
        return;

    evbuffer_drain(buf, sizeof(*frame) + ntohs(frame->length));
}

void TCPBackend::event_cb(bufferevent*, short what, void* ptr) {
    auto that = (TCPBackend *) ptr;
    that->on_event(what);
}

void TCPBackend::on_event(short what) {
    printf("GOT event.. %d\n", what);

    if (what & (BEV_EVENT_EOF|BEV_EVENT_ERROR)) {
        printf("Deleting backend..\n");
        manager_->DelBackend(this);
    }
} 

void TCPBackend::NewData(uint32_t ppid, uint8_t* data, size_t size) {
    sctp_proxy_frame frame = { 
        .length = htons(size),
        .cmd    = 0,
        .ppid   = ppid };

    bufferevent_write(buffer_.get(), &frame, sizeof(frame));
    bufferevent_write(buffer_.get(), data, size);
}
