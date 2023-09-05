#include "systemcontroller.h"

SystemController::SystemController(QObject* parent)
    : QObject{parent},
      m_currentSystemTemprature(64),
      m_targetTemp(70),
      m_systemStatusMessage("Heating"),
      m_systemState(HEATING)

{
}

int SystemController::currentSystemTemprature() const
{
  return m_currentSystemTemprature;
}

void SystemController::setCurrentSystemTemprature(int newCurrentSystemTemprature)
{
  if (m_currentSystemTemprature == newCurrentSystemTemprature)
    return;
  m_currentSystemTemprature = newCurrentSystemTemprature;
  emit currentSystemTempratureChanged();
}

int SystemController::name() const
{
  return m_targetTemp;
}

void SystemController::setName(int newTargetTemp)
{
  if (m_targetTemp == newTargetTemp)
    return;
  m_targetTemp = newTargetTemp;
  emit nameChanged();
}

void SystemController::setSystemStatusMessage(const QString& newSystemStatusMessage)
{
  if (m_systemStatusMessage == newSystemStatusMessage)
    return;
  m_systemStatusMessage = newSystemStatusMessage;
  emit systemStatusMessageChanged();
}

QString SystemController::systemStatusMessage() const
{
  return m_systemStatusMessage;
}

SystemController::HeatSelectState SystemController::systemState() const
{
  return m_systemState;
}

void SystemController::setSystemState(const HeatSelectState& newSystemState)
{
  if (m_systemState == newSystemState)
    return;
  m_systemState = newSystemState;
  emit systemStateChanged();
}
