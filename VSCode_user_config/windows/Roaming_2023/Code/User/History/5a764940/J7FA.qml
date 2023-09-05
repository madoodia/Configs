// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Window 2.15

// C++ Logic Types ------------------- //

// Custom qml types ------------------ //

Item {
  Rectangle {
    anchors.fill: parent
    color: "#0E0E0E"
  }

  Text {
    id: currentTemp
    anchors.centerIn: parent
    color: "#FFFFFF"
    font.pixelSize: 200
    text: "64"
    font.family: "Roboto"
  }

  Text {
    id: systemStatus
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: currentTemp.bottom
    }
    color: "#FFFFFF"
    font.pixelSize: 40
    text: "Heating"
    font.family: "Roboto"
  }

  Image {
    id: heatCoolSelection
    anchors {
      top: tempratureSlider.top
      right: currentTemp.left
      rightMargin: 100
    }
    width: 64
    height: 64
    source: "qrc:/UI/images/flame.png"
  }

  Image {
    id: settings
    anchors {
      bottom: tempratureSlider.bottom
      right: currentTemp.left
      rightMargin: 100
    }
    width: 64
    height: 64
    source: "qrc:/UI/images/gear.png"
  }

  TempratureControlSlider {
    id: tempratureSlider

    anchors {
      top: parent.top
      bottom: parent.bottom
      left: currentTemp.right
      margins: 100
    }
  }
}
