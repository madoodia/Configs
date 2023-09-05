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

        anchors.fill: parent
        model: controlModel

        delegate: Rectangle {
            width: parent.width
            height: parent.height / 4
            color: "#333333"
            radius: 5

            border {
                color: "#F4F4F4"
                width: 3
            }
 
            Text {
                anchors.centerIn: parent
                text: menuText
                color: "#F4F4F4"
                font.pixelSize: 50
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (menuText === "Heat")
                        systemController.systemState = 0;
                    else if (menuText === "Cool")
                        systemController.systemState = 1;
                    else if (menuText === "Auto")
                        systemController.systemState = 2;
                    heatSelectDialog.destroyMe();
                }
            }

        }

    }

}
