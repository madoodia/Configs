// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //
// C++ Logic Types ------------------- //
// Custom qml types ------------------ //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
  id: settingsScreen
  color: "#333333"
  anchors.fill: parent

  Image {
    id: backButton
    anchors {
      left: parent.left
      top: parent.top
      margins: 20
    }
    width: 48
    height: 48
    source: "qrc:/UI/images/back.png"

    MouseArea {
      anchors.fill: parent
      onClicked: mainLoader.source = "qrc:/UI/HomeScreen/HomeScreen.qml"
    }
  }
  StackView {
    id: settingsStackView
    anchors.fill: parent
    initialItem: "qrc:/UI/SettingsScreen/SettingsMainMenu.qml"
  }
}
