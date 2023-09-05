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
        onChecked: checkValue ? check1.color = "green" : check1.color = "red" // the syntax of checkValue is bullshit

        Rectangle {
            id: check1

            width: 50
            height: 50
            x: 100
            y: 100
            color: "gray"
        }

        Rectangle {
            id: check2

            width: 50
            height: 50
            x: 160
            y: 100
            color: parent.checker ? "green" : "red" // the better way
        }

        // Show the boundary of the area and whether or not it's hovered.
        Rectangle {
            color: roundMouseArea.pressed ? "red" : (roundMouseArea.containsMouse ? "darkorange" : "transparent")
            border.color: "darkorange"
            radius: width / 2
            anchors.fill: parent
        }

    }

}
