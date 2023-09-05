#include "systemcontroller.h"

SystemController::SystemController(QObject* parent)
    : QObject{parent}
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
