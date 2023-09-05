import QtQuick 2.0

Item {
  ListModel{
    id: settingsMainMenuListModel

    ListElement {menuText: "Temprature Units"}
    ListElement {menuText: "Schedule"}
    ListElement {menuText: "WiFi Settings"}
    ListElement {menuText: "About"}
  }
  
    ListView {
        id: settingsListView

        anchors.fill: innerRectangle
        model: controlModel

        delegate: Rectangle {
            width: innerRectangle.width
            height: innerRectangle.height / 3
            color: "#333333"
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
                    if (controlText === "Heat")
                        systemController.systemState = 0;
                    else if (controlText === "Cool")
                        systemController.systemState = 1;
                    else if (controlText === "Auto")
                        systemController.systemState = 2;
                    heatSelectDialog.destroyMe();
                }
            }

        }

    }

}
