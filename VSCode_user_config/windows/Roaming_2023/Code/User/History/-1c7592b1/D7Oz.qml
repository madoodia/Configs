// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //
// C++ Logic Types ------------------- //
// Custom qml types ------------------ //

// Qt QML Types ---------------------- //
import QtQuick 2.15

Rectangle {
  id: aboutPageBackground
  width: parent.width * .7
  height: parent.height * .7
  anchors.centerIn: parent
  radius: 4
  color: "#333333"
  border.color: "#F4F4F4"
  border.width: 3

  Text {
    anchors {
      top:parent.top
      left: parent.left
      leftMargin: 40
      topMargin: 60
    }
    color: "#F4F4F4"
    font.pixelSize: 30
    text: "Made By<br>"
  }
}
