#include "tcplistener.h"
#include "tcpbackend.h"

#include <unistd.h>

TCPListener::TCPListener(BackendManager* manager)
    : manager_(manager)
{}

void TCPListener::listen(int port, event_base* base) {
    struct sockaddr_in in = { 0, };
    in.sin_family = AF_INET;
    in.sin_addr.s_addr = INADDR_ANY;
    in.sin_port = htons(port); 
    
    listener_.reset(evconnlistener_new_bind(base, listen_cb, this,
                                            0, 10, (struct sockaddr *) &in, sizeof(in)));
}

void TCPListener::listen_cb(evconnlistener* listener, evutil_socket_t sock,
                            sockaddr* addr, int socklen, void* ptr) {
    TCPListener* that = reinterpret_cast<TCPListener*>(ptr);
    that->new_connection(sock);
}

void TCPListener::new_connection(evutil_socket_t sock) {
    auto base = evconnlistener_get_base(listener_.get());
    std::unique_ptr<Backend> backend = std::make_unique<TCPBackend>(manager_, base, sock);
    manager_->AddBackend(std::move(backend));
}
