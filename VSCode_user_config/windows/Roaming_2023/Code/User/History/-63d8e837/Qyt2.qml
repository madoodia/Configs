import QtQuick 2.0

Rectangle {
  id: heatSelectDialog

  signal destroyMe()

  anchors.fill: parent
  color: "#FFFFFFFF"

  MouseArea {
    anchors.fill: parent
    onClicked: heatSelectDialog.destroyMe()
  }

  Rectangle {
    id: innerRectangle

    anchors.centerIn: parent
    width: parent.width * 0.2
    height: parent.height * 0.8
    radius: 5
    color: "#0E0E0E"
    border {
      color: "#F4F4F4";
      width: 3;
    }
  }

}
