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

/**
 * I represent a backend and contain information about name
 * and health. My subclasses represent specific backends.
 */
class Backend {
public:
    virtual ~Backend() = default;

    enum Health {
        UNKNOWN,
        HEALHTHY,
    };

    bool IsHealthy() const { return health_ == HEALHTHY; }
    void SetHealth(Health health) { health_ = health_; }

    void IncrementRequest() { used_ += 1; }
    void IncrementResponse() { response_ += 1; }
    void IncrementError() { error_ += 1; }

    Backend(const Backend&) = delete;
    Backend(Backend&&) = delete;
    Backend& operator=(const Backend&) = delete;

protected:
    Backend() = default;

private:
    Health health_ = UNKNOWN;
    int used_ = 0;
    int response_ = 0;
    int error_ = 0;
};
