#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class SystemController : public QObject
{
  Q_OBJECT

  Q_PROPERTY(int currentSystemTemprature READ currentSystemTemprature WRITE setCurrentSystemTemprature NOTIFY currentSystemTempratureChanged)
  Q_PROPERTY(int targetTemp name READ name WRITE setName NOTIFY nameChanged)
  Q_PROPERTY(QString systemStatusMessage READ systemStatusMessage WRITE setSystemStatusMessage NOTIFY systemStatusMessageChanged)
  Q_PROPERTY(HeatSelectState systemState READ systemState WRITE setSystemState NOTIFY systemStateChanged)

public:
  explicit SystemController(QObject* parent = nullptr);

  enum HeatSelectState
  {
    HEATING,
    COOLING,
    AUTO
  };
  Q_ENUM(HeatSelectState)

  int currentSystemTemprature() const;
  void setCurrentSystemTemprature(int newCurrentSystemTemprature);

  int name() const;
  void setName(int newTargetTemp);

  HeatSelectState systemState() const;
  void setSystemState(const HeatSelectState& newSystemState);

signals:
  void currentSystemTempratureChanged();

  void nameChanged();

  void systemStateChanged();

private:
  int m_currentSystemTemprature;
  int m_targetTemp;
  HeatSelectState m_systemState;
};

#endif // SYSTEMCONTROLLER_H
