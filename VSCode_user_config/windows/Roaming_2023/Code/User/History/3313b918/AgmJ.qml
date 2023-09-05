import QtQuick 2.15

Flickable {
  id: flick

  width: 400
  height: 400
  contentWidth: 1000; contentHeight: 1000
  onContentHeightChanged: console.log(contentWidth)
  clip: true

  // PinchArea {
  //   anchors.fill: parent

  //   pinch.target: img
  //   pinch.maximumScale: 1
  //   pinch.minimumScale: 0.1
  //   pinch.dragAxis: Pinch.XAndYAxis

  // }

  PinchArea {
    width: Math.max(flick.contentWidth, flick.width)
    height: Math.max(flick.contentHeight, flick.height)

    property real initialWidth
    property real initialHeight

    onPinchStarted: {
      initialWidth = flick.contentWidth
      initialHeight = flick.contentHeight
    }
    onPinchUpdated: flick.resizeContent(initialWidth * pinch.scale,
    initialHeight * pinch.scale,
    pinch.center)

    onPinchFinished: flick.returnToBounds()
  }

  Image {
    id: img

    width: flick.contentWidth
    height: flick.contentHeight
    source: "../../images/flick.jpg"
  }

}
