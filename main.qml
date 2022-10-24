import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import "js1.js" as MyFirstScript

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property string gfigure: "Star"


    ComboBox {
        width: 200
        currentIndex: 0
        textRole: "key"
        model: ListModel {
            id: figure_combo
            ListElement { key: "Star" }
            ListElement { key: "Ring" }
            ListElement { key: "House" }
            ListElement { key: "SandWatch" }
        }

        onCurrentIndexChanged: gfigure = figure_combo.get(currentIndex).key
    }


    Canvas {
        id: mycanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1); // Красный
            ctx.beginPath()

            var figure = gfigure
            var point_origin = MyFirstScript.choose_figure(figure, 0)
            ctx.moveTo(point_origin[0], point_origin[1]);

            for (var i = 1; i < 100; i++) {
                var point = MyFirstScript.choose_figure(figure, i)
                if (point[0] == -1)
                    break
                ctx.lineTo(point[0], point[1]);
            }

            ctx.moveTo(point_origin[0], point_origin[1]);

            ctx.closePath()
            ctx.lineWidth = 2;
            ctx.stroke();
            ctx.fill()
        }
    }

    Component.onCompleted: {
        //var pt = MyFirstScript.choose_figure("star", 1)
        //console.log(pt)
    }
}
