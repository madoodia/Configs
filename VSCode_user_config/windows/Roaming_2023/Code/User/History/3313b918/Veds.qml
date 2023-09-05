import QtQuick 2.15

Flickable {
  id: flick

  width: 400
  height: 400
  contentWidth: 1000
  contentHeight: 1000

  PinchArea {
    anchors.fill: parent
    pinch: {
      target: img
      maximumScale: 1.0
      minimumScale: 0.1

    }
  }

  Image {
    id: img

    width: flick.contentWidth
    height: flick.contentHeight
    source: "../../images/flick.jpg"
  }

}
