/* --------------------- */
/* (C) 2020 madoodia.com */
/* --------------------- */

// GLEW should be first library that is included
#include "glviewport.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQuickView>
#include <QSurfaceFormat>

// main ------------------------
int main(int argc, char** argv)
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QQuickStyle::setStyle("Material");
  // QQuickStyle::setFallbackStyle("Material");

  Application app(argc, argv);

  getOpenCLInfo();

  QQmlApplicationEngine engine;

  qmlRegisterType<GLViewport>("Zolf", 0, 1, "GLViewport");
  // qRegisterMetaType<Qt::ApplicationState *>("Qt::ApplicationState");

  engine.load(QUrl("qrc:/main.qml"));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}

// -----------------------------------------------------------
// -----------------
// app.libraryPath()
// printf("Paths:\n");
// for (const QString &path_ : app.libraryPaths())
// {
//   printf("%s\n", path_.toStdString().c_str());
// }
// -----------------
// -no-gui
// QCoreApplication* createApplication(int &argc, char *argv[])
// {
//     for (int i = 1; i < argc; ++i)
//         if (!qstrcmp(argv[i], "-no-gui"))
//             return new QCoreApplication(argc, argv);
//     return new QApplication(argc, argv);
// }

// int main(int argc, char* argv[])
// {
//     QScopedPointer<QCoreApplication> app(createApplication(argc, argv));

//     if (qobject_cast<QApplication *>(app.data())) {
//        // start GUI version...
//     } else {
//        // start non-GUI version...
//     }

//     return app->exec();
// }
