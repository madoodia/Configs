import QtQuick 2.15

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
      onClicked: mainLoader.source = "../HomeScreen/HomeScreen.qml"
    }
  }
}
