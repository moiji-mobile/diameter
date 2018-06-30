/*
 * Osmocom: Simple SCTP to TCP proxy. SCTP Frontend.
 * (C) 2018 by Holger Hans Peter Freyther
 * All Rights Reserved
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#pragma once


/**
 * TODO(holgerf): This should certainly be symmetric with the backend at
 * some point. Weave with a hot needle and move it forward.
 */
class SCTPFrontend {
public:
    virtual ~SCTPFrontend() = default;


    void NewData(uint32_t ppid, uint8_t* data, size_t size);

private:
    static void data_cb(bufferevent*, void*);
    static void event_cb(bufferevent*, short what, void*);

    void on_data();
    void on_event(short what);
};
