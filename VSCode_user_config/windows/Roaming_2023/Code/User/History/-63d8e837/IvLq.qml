import QtQuick 2.0

Rectangle {
  id: heatSelectDialog
  signal destroyMe()

  anchors.fill: parent
  color: "#0E0E0E"

  MouseArea {
    anchors.fill: parent
    onClicked: heatSelectDialog.destroyMe()
  }

  Rectangle {
    id: innerRectangle

    width: parent.width * .2
    height: parent.height* .8
    color: "#0E0E0E"

    border: {
      color: "#F4F4F4"
      width: 3
    }
  }

}
