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
    ListModel {
        id: settingsMainMenuListModel

        ListElement {
            menuText: "Temprature Units"
            iconSource: "qrc:/UI/images/temprature.png"
        }

        ListElement {
            menuText: "Schedule"
            iconSource: "qrc:/UI/images/schedule.png"
        }

        ListElement {
            menuText: "WiFi Settings"
            iconSource: "qrc:/UI/images/wifi.png"
        }

        ListElement {
            menuText: "About"
            iconSource: "qrc:/UI/images/about.png"
        }

    }

    Rectangle {
        id: settingsViewBG

        width: parent.width * 0.7
        height: parent.height * 0.7
        anchors.centerIn: parent
        color: "#333333"
        border.width: 2
        border.color: "#F4F4F4"
        radius: 3
    }

    ListView {
        id: settingsListView

        interactive: false
        anchors.fill: settingsViewBG
        model: settingsMainMenuListModel

        delegate: Rectangle {
            width: settingsViewBG.width
            height: settingsViewBG.height / 4
            color: "#333333"
            radius: 5

            border {
                color: "#F4F4F4"
                width: 3
            }

            Image {
                id: iconImage

                source: iconSource
                width: 48
                height: 48

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 30
                }

            }

            Text {
                id: delegateText

                text: menuText
                color: "#F4F4F4"
                font.pixelSize: 30
                horizontalAlignment: left

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: iconImage.right
                    leftMargin: 20
                }

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }

        }

    }

}
