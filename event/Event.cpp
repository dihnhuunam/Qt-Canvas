#include "Event.h"

Event::Event(EventType type, const std::any &payload, EventPriority priority)
    : mType(type), mPayload(payload), mPriority(priority)
{
}

Event::Event(EventType type, std::any &&payload, EventPriority priority)
    : mType(type), mPayload(payload), mPriority(priority)
{
}

EventType Event::getType() const
{
    return mType;
}

EventPriority Event::getPriority() const
{
    return mPriority;
}

template <class T> T Event::getPayload() const
{
    return std::any_cast<T>(mPayload);
}
