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
}
