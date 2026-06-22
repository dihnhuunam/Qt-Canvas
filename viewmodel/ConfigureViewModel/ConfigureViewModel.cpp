#include "ConfigureViewModel.h"

#include <QDebug>
#include <cmath>

namespace {
bool doubleCompare(double lhs, double rhs, double scale = 1000.0) {
  return std::llround(lhs * scale) == std::llround(rhs * scale);
}
} // namespace

ConfigureViewModel::ConfigureViewModel(QObject *parent) : QObject(parent) {}

ConfigureViewModel::~ConfigureViewModel() {}

double ConfigureViewModel::getAmplitude() const {
  return mSignal.getAmplitude();
}

double ConfigureViewModel::getFrequency() const {
  return mSignal.getFrequency();
}

double ConfigureViewModel::getPhase() const { return mSignal.getPhase(); }

void ConfigureViewModel::setAmplitude(double nAmplitude) {
  if (doubleCompare(getAmplitude(), nAmplitude, 1000.0)) {
    qDebug() << nAmplitude;
    return;
  }

  mSignal.setAmplitude(nAmplitude);
  emit amplitudeChanged();
}

void ConfigureViewModel::setFrequency(double nFrequency) {
  if (doubleCompare(getFrequency(), nFrequency, 1000.0)) {
    return;
  }

  mSignal.setFrequency(nFrequency);
  emit frequencyChanged();
}

void ConfigureViewModel::setPhase(double nPhase) {
  if (doubleCompare(getPhase(), nPhase, 1000.0)) {
    return;
  }

  mSignal.setPhase(nPhase);
  emit phaseChanged();
}
