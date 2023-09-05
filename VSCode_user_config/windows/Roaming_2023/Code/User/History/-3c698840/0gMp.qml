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

  Rectangle {
    id: settingViewBG

    width: parent.width * .7
    height: parent.height * .7
    anchors.centerIn: parent
    color: "black"
    border.width: 3
    border.color: "#F4F4F4"
    radius: 3
  }
}
