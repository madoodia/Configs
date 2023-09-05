// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //
// C++ Logic Types ------------------- //

// Custom qml types ------------------ //

// Qt QML Types ---------------------- //
import QtQuick 2.15

Item {
  id: homeScreen

  property var heatSelectDialogHolder: null

  Component {
    id: heatSelectDialogComp
    HeatSelectDialog {}
  }

  function destroyHeatSelectDialog() {
    if (heatSelectDialogHolder !== null) {
      heatSelectDialogHolder.destroy()
      heatSelectDialogHolder = nullF
    }
  }

  function createHeatSelectDialog() {
    if (heatSelectDialogHolder === null) {
      heatSelectDialogHolder = heatSelectDialogComp.createObject(homeScreen, {
                                                        "x": 0,
                                                        "y": 0
                                                      })
      if (heatSelectDialogHolder) {
        heatSelectDialogHolder.anchors.fill = homeScreen
        heatSelectDialogHolder.destroyMe.connect(destroyHeatSelectDialog)
      }
    }
  }

  Rectangle {
    anchors.fill: parent
    color: "#0E0E0E"
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

    color: "#FFFFFF"
    font.pixelSize: 40
    text: systemController.systemStatusMessage
    font.family: "Roboto"

    anchors {
      horizontalCenter: parent.horizontalCenter

      top: currentTemp.bottom
    }
  }

  Image {
    id: heatCoolSelection

    width: 64
    height: 64
    source: {
      if (systemController.systemState === 0) {
        return "qrc:/UI/images/flame.png"
      } else if (systemController.systemState === 1) {
        return "qrc:/UI/images/snow.png"
      } else if (systemController.systemState === 2) {
        return "qrc:/UI/images/auto.png"
      }
    }

    anchors {
      top: tempratureSlider.top
      right: currentTemp.left
      rightMargin: 100
    }

    MouseArea {
      anchors.fill: parent
      onClicked: createHeatSelectDialog()
    }
  }

  Image {
    id: settings

    width: 64
    height: 64
    source: "qrc:/UI/images/gear.png"

    anchors {
      bottom: tempratureSlider.bottom
      right: currentTemp.left
      rightMargin: 100
    }
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
