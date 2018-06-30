/*
 * Osmocom: Simple SCTP to TCP proxy. Backend.
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

#include "backend.h"

#include <memory>
#include <vector>


/**
 * I hold a list of backends... and can be used by policies
 * to schedule messages to them.
 */
class BackendManager {
public:

    void AddBackend(std::unique_ptr<Backend>&& backend); 
    void DelBackend(Backend*);

private:
    void IncrConnect() { connects_ += 1; };
    void IncrDisconnect() { disconnects_ += 1; };

private:
    std::vector<std::unique_ptr<Backend>> backends_;
    uint64_t connects_ = 0;
    uint64_t disconnects_ = 0;
};
