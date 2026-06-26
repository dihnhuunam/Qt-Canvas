#pragma once

#include <QObject>

#include "Signal.h"

class ConfigureViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double amplitude READ getAmplitude WRITE setAmplitude NOTIFY amplitudeChanged);
    Q_PROPERTY(double frequency READ getFrequency WRITE setFrequency NOTIFY frequencyChanged);
    Q_PROPERTY(double phase READ getPhase WRITE setPhase NOTIFY phaseChanged);

  public:
    explicit ConfigureViewModel(QObject *parent = nullptr);
    ~ConfigureViewModel();

    double getAmplitude() const;
    double getFrequency() const;
    double getPhase() const;

    void setAmplitude(double nAmplitude);
    void setFrequency(double nFrequency);
    void setPhase(double nPhase);

  signals:
    void amplitudeChanged();
    void frequencyChanged();
    void phaseChanged();

  private:
    Signal mSignal;
};
