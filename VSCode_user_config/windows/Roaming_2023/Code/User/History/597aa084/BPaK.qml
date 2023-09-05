// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //

// Qt QML Types ---------------------- //
import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
// C++ Logic Types ------------------- //
import Zolf 0.1
// Custom qml types ------------------ //
import "./qml"

Window {
  // Component.onCompleted: showMaximized()

  id: main

  width: 1000
  height: 600
  visible: true
  Material.theme: Material.Dark
  Material.accent: Material.LightBlue

  MSplitView {
    id: splitView

    anchors.fill: parent
    orientation: Qt.Horizontal
    ratio: 0.5
    firstItem: leftPane
    secondItem: rightPane

    Item {
      // MouseArea {
      //     anchors.fill: parent
      //     acceptedButtons: Qt.AllButtons
      //     propagateComposedEvents: true
      //     onClicked: {
      //         console.log("Second:onClicked");
      //         mouse.accepted = false;
      //     }
      //     // cursorShape: Qt.WaitCursor
      //     Rectangle {
      //         anchors.fill: parent
      //         color: Qt.rgba(1, 0, 0, 0.2)
      //     }
      // }

      id: leftPane

      implicitWidth: main.width * 0.7
      implicitHeight: main.height

      GLViewport {
        anchors.fill: parent

        MouseArea {
          mouse.accepted = true

          anchors.fill: parent
          acceptedButtons: Qt.AllButtons
          propagateComposedEvents: true
          onClicked: {
            console.log("GLViewport:onClicked");
          }
        }

      }

      Rectangle {
        color: Qt.rgba(1, 1, 1, 0.7)
        radius: 10
        border.width: 1
        border.color: "white"
        anchors.fill: label
        anchors.margins: -10
      }

      Text {
        id: label

        color: "black"
        wrapMode: Text.WordWrap
        text: "This is OpenGL background with some QML texts on it!, Building System is Almost Done!!!!"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 20
      }

    }

    Item {
      id: rightPane

      implicitWidth: main.width * 0.1
      implicitHeight: main.height

      MSplitView {
        id: splitView2

        anchors.fill: parent
        orientation: Qt.Vertical
        ratio: 0.5
        firstItem: propertyEditor
        secondItem: nodeEditor

        Item {
          id: propertyEditor

          implicitWidth: main.width / 3
          implicitHeight: rightPane.height / 2

          Rectangle {
            anchors.fill: parent
            color: "#232323"

            Label {
              id: lable

              text: "Properties Editor\n" + parent.width + ":" + parent.height
              anchors.top: parent.top
              color: Qt.rgba(1, 1, 1, 1)
            }

            Column {
              id: radios

              anchors.top: lable.bottom

              RadioButton {
                text: qsTr("Small")
              }

              RadioButton {
                text: qsTr("Medium")
                checked: true
              }

              RadioButton {
                text: qsTr("Large")
              }

            }

            TextField {
              id: txt

              anchors.top: radios.bottom
              placeholderText: "search here ..."
            }

            SpinBox {
              id: spin

              anchors.top: txt.bottom
              value: 50
              Material.foreground: Material.Lime
              Material.accent: Material.BlueGrey
              Material.elevation: 6
            }

            Slider {
              // background: Rectangle {
              //   x: slider1.leftPadding
              //   y: slider1.topPadding + slider1.availableHeight / 2 - height / 2
              //   implicitWidth: 200
              //   implicitHeight: 3
              //   width: slider1.availableWidth
              //   height: 3
              //   radius: 2
              //   // color: slider1.enabled ? "#1e1e1e" : "#999999"

              id: slider1

              x: 100
              y: 100
              enabled: true
              handle.width: 10
              handle.height: 10
              anchors.top: spin.bottom
              //   Rectangle {
              //     width: slider1.visualPosition * parent.width
              //     height: 3
              //     // color: slider1.enabled ? "#aaaaaa" : "#00ff00"
              //     color: "#a9a9a9"
              //     radius: 2
              //   }
              // }
              wheelEnabled: true
            }

            Slider {
              id: slider2

              anchors.top: slider1.bottom
              x: 100
              y: 150
            }

            Slider {
              id: slider3

              anchors.top: slider2.bottom
              x: 100
              y: 200
            }

          }

        }

        Item {
          id: nodeEditor

          implicitWidth: main.width / 3
          implicitHeight: rightPane.height / 2
          SplitView.minimumWidth: 300

          Rectangle {
            anchors.fill: parent
            color: "darkgray"

            Label {
              text: "Nodes Editor\n" + parent.width + ":" + parent.height
              anchors.centerIn: parent
              color: Qt.rgba(0.1, 0.1, 0.1, 1)
            }

            Rectangle {
              width: 100
              height: 30
              x: 100
              y: 100
              color: "lightblue"

              Rectangle {
                width: 3
                height: 30
                color: "darkblue"
              }

              Text {
                anchors.centerIn: parent
                text: "Box"
              }

            }

            Rectangle {
              x: 100
              y: 400
              width: 380
              height: 32
              radius: 70
              color: "lightgray"
            }

            Rectangle {
              x: 100
              y: 450
              width: 80
              height: 32
              radius: 70
              color: "lightgray"
            }

          }

        }

        handle: Rectangle {
          implicitWidth: 4
          implicitHeight: 4
          color: SplitHandle.pressed ? "#81e889" : (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
        }

      }

    }

    // My Qt version is too old to use the QtQuick.Controls 2 version...
    handle: Rectangle {
      implicitWidth: 4
      implicitHeight: 4
      color: SplitHandle.pressed ? "#81e889" : (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
    }

  }

}
