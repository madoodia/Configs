import QtQuick 2.15

Item {
    id: roundMouseArea

    property alias mouseX: mouseArea.mouseX
    property alias mouseY: mouseArea.mouseY
    property bool containsMouse: {
        var x1 = width / 2;
        var y1 = height / 2;
        var x2 = mouseX;
        var y2 = mouseY;
        var distanceFromCenter = Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2);
        var radiusSquared = Math.pow(Math.min(width, height) / 2, 2);
        var isWithinOurRadius = distanceFromCenter < radiusSquared;
        return isWithinOurRadius;
    }
    readonly property bool pressed: containsMouse && mouseArea.pressed
    property bool checker: false // better way          <<----- (2)

    signal clicked()
    signal checked(bool checkValue) // not a good way   <<----- (1)

    MouseArea {
        id: mouseArea

        property bool __checked: false

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (roundMouseArea.containsMouse)
                roundMouseArea.clicked();

            // emit clicked signal
            __checked = !__checked;
            parent.checked(__checked); // emit checked signal
            parent.checker = !parent.checker;
        }
    }

}
