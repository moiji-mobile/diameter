#include "backendmanager.h"

#include <utility>


void BackendManager::AddBackend(std::unique_ptr<Backend>&& backend) {
    backends_.push_back(std::move(backend));
    IncrConnect();
}

void BackendManager::DelBackend(Backend* backend) {
    backends_.erase(std::remove_if(backends_.begin(), backends_.end(),
                                   [backend](const std::unique_ptr<Backend>& rhs) { 
                                        return backend == rhs.get();}),
                    backends_.end());
    IncrDisconnect();
}
