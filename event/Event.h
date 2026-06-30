#pragma once

#include <any>

#include "EventDef.h"

class Event final
{
  private:
    EventType mType{EventType::None};
    std::any mPayload{};
    EventPriority mPriority{EventPriority::Normal};

  public:
    // Initialize
    Event(EventType type, const std::any &payload, EventPriority priority = EventPriority::Normal);
    Event(EventType type, std::any &&payload = std::any(), EventPriority priority = EventPriority::Normal);

    // Default
    Event() = default;
    ~Event() = default;

    // Copy constructor & copy assignment
    Event(const Event &) = default;
    Event &operator=(const Event &) = default;

    // Move constructor & move assignment
    Event(Event &&) = default;
    Event &operator=(Event &&) = default;

    // Getter
    EventType getType() const;
    EventPriority getPriority() const;
    template <class T> T getPayload() const;
};
