import QtQuick 2.15
import QtQuick.Window 2.0

Window
{
id: mainWindow
width: 800
height: 800
x: (Screen.width - width) / 2
y: (Screen.height - height) / 2
visible: true

Canvas {
  id: canvas
  property var objects: []
  property var connections: []
  property int objectSize: 50
    property int objectCount: 30
      property point startPoint: Qt.point(0, 0)
      property point endPoint: Qt.point(0, 0)
      anchors.fill: parent
      focus: true
      Component.onCompleted: {
        fillField();
      }

      function fillField()
      {
        for (var i = 0;i < canvas.objectCount;i ++) {
          do {
            var x = canvas.objectSize + Math.round(Math.random() * (mainWindow.width - canvas.objectSize * 2));
            var y = canvas.objectSize + Math.round(Math.random() * (mainWindow.height - canvas.objectSize * 2));
            if (checkCoord(x, y) === true)
            {
              objects.push(Qt.point(x, y));
              break;
            }
          } while(true);
        }
        canvas.requestPaint();
      }

      function checkCoord(_x, _y)
      {
        for (var i = 0;i < objects.length;i ++) {
          if (Math.abs(objects[i].x - _x) < canvas.objectSize &&
          Math.abs(objects[i].y - _y) < canvas.objectSize) {
          return objects[i];
        }
      }
      return true;
    }

    onPaint: {
      var ctx = getContext("2d");
      ctx.beginPath();
      ctx.fillStyle = Qt.rgba(1, 1, 1, 1);
      ctx.fillRect(0, 0, width, height);
      ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
      ctx.strokeStyle = Qt.rgba(0.8, 0.8, 0.8, 1);
      ctx.lineWidth = 3;
      ctx.lineCap = "round";
      ctx.lineJoin = "round";
      for (var i = 0;i < objects.length;i ++) {
        ctx.ellipse(objects[i].x - canvas.objectSize/2, objects[i].y - canvas.objectSize/2, canvas.objectSize, canvas.objectSize);
      }
      if (startPoint.x !== 0 && startPoint.y !== 0)
      {
        ctx.moveTo(startPoint.x, startPoint.y);
        ctx.lineTo(endPoint.x, endPoint.y);
      }
      ctx.fill();
      ctx.stroke();
      ctx.beginPath();
      ctx.strokeStyle = Qt.rgba(0, 0, 1, 1);
      ctx.lineWidth = 5;
      for (var i = 0;i < connections.length;i ++) {
        ctx.moveTo(connections[i].start.x, connections[i].start.y);
        ctx.lineTo(connections[i].end.x, connections[i].end.y);
      }
      ctx.stroke();
      ctx.beginPath();
      ctx.fillStyle = Qt.rgba(1, 1, 0, 1);
      for (var i = 0;i < connections.length;i ++) {
        ctx.ellipse(connections[i].start.x - 5, connections[i].start.y - 5, 10, 10);
        ctx.ellipse(connections[i].end.x - 5, connections[i].end.y - 5, 10, 10);
      }
      ctx.fill();
    }

    MouseArea {
      anchors.fill: parent
      onPressed: {
        var point = canvas.checkCoord(mouse.x, mouse.y);
        if (point !== true)
        {
          canvas.startPoint = point;
        }
        else
          canvas.startPoint = Qt.point(0, 0);
        }
        onReleased: {
          if (canvas.startPoint.x === 0 && canvas.startPoint.y === 0)
            return;
          var point = canvas.checkCoord(mouse.x, mouse.y);
          if (point === true)
            canvas.startPoint = Qt.point(0, 0);
          else {
            if (point.x !== canvas.startPoint.x || point.y !== canvas.startPoint.y)
            {
            canvas.connections.push({
              start: Qt.point(canvas.startPoint.x, canvas.startPoint.y),
              end: Qt.point(point.x, point.y)
            });
          }
          canvas.startPoint = Qt.point(0, 0);
        }
        canvas.requestPaint();
      }
      onPositionChanged: {
        if (canvas.startPoint.x !== 0 && canvas.startPoint.y !== 0)
        {
          canvas.endPoint = Qt.point(mouse.x, mouse.y);
          canvas.requestPaint();
        }
      }
    }

    Keys.onPressed: {
      switch(event.key)
    {
      case Qt.Key_Escape:
      canvas.objects = [];
      canvas.connections = [];
      canvas.startPoint = Qt.point(0, 0);
      canvas.endPoint = Qt.point(0, 0);
      canvas.fillField();
      break;
      case Qt.Key_Backspace:
      canvas.connections.pop();
      canvas.requestPaint();
    }
  }
}

Text {
  text: " Esc - rearange, Backspace - undo ";
}

Text {
  text: "Draw your own constellation"
  font.bold: true
  font.capitalization: Font.AllUppercase
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.top: parent.top
}
}