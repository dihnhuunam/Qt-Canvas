#pragma once

#include "SignalDef.h"

class Signal {
public:
  Signal();
  ~Signal();

  double getAmplitude() const;
  double getFrequency() const;
  double getPhase() const;

  void setAmplitude(double nAmplitude);
  void setFrequency(double nFrequency);
  void setPhase(double nPhase);

private:
  SignalParam mParameter;
};
