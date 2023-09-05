import QtQuick 2.5
import QtQuick.Window 2.2

Window {
  width: 640
  height: 480
  visible: true

  RoundMouseArea {
    id: roundMouseArea

    width: 100
    height: 100
    anchors.centerIn: parent
    onClicked: print("clicked")

    // Show the boundary of the area and whether or not it's hovered.
    Rectangle {
      color: roundMouseArea.pressed ? "red" : (roundMouseArea.containsMouse ? "darkorange" : "transparent")
      border.color: "darkorange"
      radius: width / 2
      anchors.fill: parent
    }

  }

}
