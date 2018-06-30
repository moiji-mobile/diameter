cc_binary(
    name = "sctpproxy",
    srcs = [
        "main.cc",
        "backend.h",
        "backendmanager.cc",
        "backendmanager.h",
        "event_helper.h",
        "frame.h",
        "sctpfrontend.cc",
        "sctpfrontend.h",
        "tcpbackend.cc",
        "tcpbackend.h",
        "tcplistener.cc",
        "tcplistener.h",
    ],
    linkopts = [
        "-levent_core",
    ],
)
