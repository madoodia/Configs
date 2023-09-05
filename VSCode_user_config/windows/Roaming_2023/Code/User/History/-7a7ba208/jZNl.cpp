/* --------------------- */
/* (C) 2020 madoodia.com */
/* --------------------- */
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "Controllers/systemcontroller.h"

int main(int argc, char* argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  qmlRegisterType<SystemController>("madoodia", 1, 0, "SystemController");

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated,
      &app, [url](QObject* obj, const QUrl& objUrl)
      {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1); },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
