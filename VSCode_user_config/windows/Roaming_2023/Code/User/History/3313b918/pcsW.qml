import QtQuick 2.15

Flickable {
  id: flick

  width: 400
  height: 400
  contentWidth: 1000
  contentHeight: 1000

  PinchArea {
    anchors.fill: parent
    Pinch: {
      target:
      img;
      maximumScale:
      1;
      minimumScale:
      0.1;
      dragAxis:
      Pinch.XAndYAxis
    }
  }

  Image {
    id: img

    width: flick.contentWidth
    height: flick.contentHeight
    source: "../../images/flick.jpg"
  }
}
