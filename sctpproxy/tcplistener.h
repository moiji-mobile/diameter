#pragma once

#include "backendmanager.h"
#include "event_helper.h"

class TCPListener {
public:
    TCPListener(BackendManager* manager);

    void listen(int port, event_base* base);

private:
    static void listen_cb(evconnlistener* listener, evutil_socket_t sock,
                      sockaddr* addr, int socklen, void* ptr);
    void new_connection(evutil_socket_t sock);

private:
    BackendManager* manager_;
    std::unique_ptr<evconnlistener, EvevconnlistenerDeleter> listener_;
};
