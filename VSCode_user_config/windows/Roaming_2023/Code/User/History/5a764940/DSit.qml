// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Window 2.15

// C++ Logic Types ------------------- //

// Custom qml types ------------------ //
import madoodia 1.0

Item {
  Rectangle {
    anchors.fill: parent
    color: "#0E0E0E"
  }

  SystemController {
    id: systemController

  }

  Text {
    id: currentTemp
    anchors.centerIn: parent
    color: "#FFFFFF"
    font.pixelSize: 200
    // systemController is detected by Loader in main.qml
    text: systemController.currentSystemTemprature
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
    text: systemController.systemStatusMessage
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
    source: {
      if (systemController.systemState === 0)
        return "qrc:/UI/images/flame.png"
      else if(systemController.systemState === 1)
        return "qrc:/UI/images/snow.png"
        else if(systemController.systemState === 2)
          return "qrc:/UI/images/auto.png"
        }
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

        value: systemController.targetTemp

        anchors {
          top: parent.top
          bottom: parent.bottom
          left: currentTemp.right
          margins: 100
        }
      }
    }
