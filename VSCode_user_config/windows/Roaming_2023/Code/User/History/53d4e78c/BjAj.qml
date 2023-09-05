// -------------------------------------- //
//          (C) 2020 madoodia.com         //
//           All Rights Reserved!         //
// -------------------------------------- //
// C++ Logic Types ------------------- //
// Custom qml types ------------------ //

// Qt QML Types ---------------------- //
import QtQuick 2.15
import QtQuick.Controls 2.15


Item {
  ListModel{
    id: settingsMainMenuListModel

    ListElement {menuText: "Temprature Units"}
    ListElement {menuText: "Schedule"}
    ListElement {menuText: "WiFi Settings"}
    ListElement {menuText: "About"}
  }

  Rectangle {
    id: settingsViewBG

    width: parent.width * .7
    height: parent.height * .5
    anchors.centerIn: parent
    color: "#333333"
    border.width: 3
    border.color: "#F4F4F4"
    radius: 3
  }
  
  ListView {
      id: settingsListView

      anchors.fill: parent
      model: settingsMainMenuListModel

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
              font.pixelSize: 30
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
