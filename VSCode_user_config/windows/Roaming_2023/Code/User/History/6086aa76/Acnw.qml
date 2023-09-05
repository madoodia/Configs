// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Controls 2.15

// C++ Logic Types ------------------- //

// Custom qml types ------------------ //

Slider {
  id: temptratureControlSlider
  value: 85
  from: 12
  to: 90
  stepSize: 1
  orientation: Qt.Vertical

  background: Rectangle {
    height: parent.height
    width: 3
    anchors.centerIn: parent
  }

  handle: Rectangle {
    y: temptratureControlSlider.visualPosition * (temptratureControlSlider.availableHeight - height)
    width: 76
    height: 76
    radius: width/ 2

    color: "#0E0E0E"
    border.color: "#D9D9D9"
    border.width: 3
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
      anchors.centerIn: parent
      color: "#D9D9D9"
      font.pixelSize: 30
      text: temptratureControlSlider.value
    }
  }
}
