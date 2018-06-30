#include "backendmanager.h"
#include "event_helper.h"
#include "tcplistener.h"


#include <iostream>
#include <memory>

static int FLAG_port = 5672;

int main(int argc, char** argv) {
    std::unique_ptr<event_base, Evevent_baseDeleter> base;
    base.reset(event_base_new());

    BackendManager manager;

    TCPListener listener(&manager);
    listener.listen(FLAG_port, base.get());

    event_base_dispatch(base.get());
    return 0;
}
