import QtQuick 2.15

Item {

id: root
height: 30
width: 30

property Canvas myCanvas
property var start
property var end

Component.onCompleted: {
    end = root
}

onXChanged: myCanvas.requestPaint()
onYChanged: myCanvas.requestPaint()

Rectangle {
    id: rect
    color: "blue"
    anchors.fill: root

    MouseArea {
        id: mouseArea

        anchors.fill: rect
        Drag.active: true
        drag.target: root
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.minimumY: 0

        onReleased: mouseArea.Drag.drop()
    }

}
} 