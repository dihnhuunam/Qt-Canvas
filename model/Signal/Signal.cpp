#include "Signal.h"

Signal::Signal()
{
}

Signal::~Signal()
{
}

double Signal::getAmplitude() const
{
    return mParameter.mAmplitude;
}

double Signal::getFrequency() const
{
    return mParameter.mFrequency;
}

double Signal::getPhase() const
{
    return mParameter.mPhase;
}

void Signal::setAmplitude(double nAmplitude)
{
    mParameter.mAmplitude = nAmplitude;
}

void Signal::setFrequency(double nFrequency)
{
    mParameter.mFrequency = nFrequency;
}

void Signal::setPhase(double nPhase)
{
    mParameter.mPhase = nPhase;
}
