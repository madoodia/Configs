#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class SystemController : public QObject
{
  Q_OBJECT

  Q_PROPERTY(int currentSystemTemprature READ currentSystemTemprature WRITE setCurrentSystemTemprature NOTIFY currentSystemTempratureChanged)

public:
  explicit SystemController(QObject* parent = nullptr);

  int currentSystemTemprature() const;
  void setCurrentSystemTemprature(int newCurrentSystemTemprature);

signals:
  void currentSystemTempratureChanged();

private:
  int m_currentSystemTemprature;
};

#endif // SYSTEMCONTROLLER_H
