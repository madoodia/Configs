// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //
// C++ Logic Types ------------------- //
// Custom qml types ------------------ //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
  id: main

  width: 640
  height: 480
  visible: true
  title: qsTr("FigmaQML_Thermostat")

  Loader {
    id: mainLoader
    anchors.fill: parent

    source: "./UI/HomeScreen/HomeScreen.qml"
  }
}
