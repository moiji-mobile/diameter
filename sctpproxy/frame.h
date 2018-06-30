#pragma once

#include <stdint.h>

/* 
 * Network Byte order
 */
struct sctp_proxy_frame {
    uint16_t    length;
    uint16_t    cmd;
    uint32_t    ppid;
} __attribute__((packed));
