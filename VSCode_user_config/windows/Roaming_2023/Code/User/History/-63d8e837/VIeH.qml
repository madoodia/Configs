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

    ListModel {
      id: heatModel

      ListElement {text: "Heat"}
      ListElement {text: "Cool"}
      ListElement {text: "Auto"}
    }

    ListView {
      id: heatListView
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

}
