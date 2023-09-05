import QtQuick 2.15

Flickable {
  id: flick

  width: 400
  height: 400
  contentWidth: 1000; contentHeight: 1000
  onContentHeightChanged: console.log(contentWidth)

  // PinchArea {
  //   anchors.fill: parent

  //   pinch.target: img
  //   pinch.maximumScale: 1
  //   pinch.minimumScale: 0.1
  //   pinch.dragAxis: Pinch.XAndYAxis

  // }

  PinchArea {

  }

  Image {
    id: img

    width: flick.contentWidth
    height: flick.contentHeight
    source: "../../images/flick.jpg"
  }

}
