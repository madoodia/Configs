import QtQuick 2.0

Rectangle {
    id: heatSelectDialog

    signal destroyMe()

    anchors.fill: parent
    color: "#00FFFFFF" // transparent with alpha = 0

    MouseArea {
        anchors.fill: parent
        onClicked: heatSelectDialog.destroyMe()
    }
    
    Rectangle {
        id: innerRectangle

        anchors.centerIn: parent
        width: parent.width * 0.5
        height: parent.height * 0.8
        radius: 5
        color: "#0E0E0E"

        border {
            color: "#F4F4F4"
            width: 3
        }

    }

    ListModel {
      id: controlModel

      ListElement {controlText: "Heat"}
      ListElement {controlText: "Cool"}
      ListElement {controlText: "Auto"}
    }

    ListView {
      id: heatListView

      anchors.fill: innerRectangle
      model: controlModel

      delegate: Rectangle {
        width: innerRectangle.width
        height: innerRectangle.height / 3
        color: "#0E0E0E"
        radius: 5
        border {
            color: "#F4F4F4"
            width: 3
        }
        Text {
          anchors.centerIn: parent
          text: controlText
          color: "#F4F4F4"
          font.pixelSize: 50
        }
        MouseArea {
          anchors.fill: parent
          onClicked: {
            
          }
        }
      }
    }

}
