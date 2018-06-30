#pragma once

#include <event2/event.h>
#include <event2/listener.h>
#include <event2/bufferevent.h>

extern "C" {
    void bufferevent_free(bufferevent*);
}

#define EV_DELETER(Type, Function)      \
    struct Ev ## Type ## Deleter {      \
        void operator()(Type* type) {   \
            Function(type);             \
        }                               \
    }

EV_DELETER(bufferevent, bufferevent_free);
EV_DELETER(evconnlistener, evconnlistener_free);
EV_DELETER(event_base, event_base_free);
