import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


Window {
    id: primaryFrame
    width: 540
    height: 520
    visible: true
    title: qsTr("Animation1")
    color: "#e5ecef"

    property string current_color: "#0000FF"
    property string finish_color: ""

    function randomize_Color() {
        finish_color = "#"

        for (var i = 0; i < 6; i++) {
            var symbol = Math.floor(Math.random() * (15 - 0 + 1) + 0)
            if (symbol == 10)
                       symbol = "A"
            if (symbol == 11)
                       symbol = "B"
            if (symbol == 12)
                       symbol = "C"
            if (symbol == 13)
                       symbol = "D"
            if (symbol == 14)
                       symbol = "E"
            if (symbol == 15)
                       symbol = "F"
            finish_color += String(symbol)
        }

        anim1.start()
    }

    function became_Circle() {
        anim2.start()
    }

    Rectangle { //
        id: rect_cnhange_color
        height: 300
        width: 300
        color: "#0000FF"
        radius: 1
        anchors.horizontalCenter: parent.horizontalCenter //
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            hoverEnabled: true
            onClicked: {
                if (mouse.button == Qt.RightButton)
                   anim3.start()
                else
                   randomize_Color()
            }
            onDoubleClicked: became_Circle()
        }
    }


    PropertyAnimation {
        id: anim1
        target: rect_cnhange_color
        property: "color" //
        from: current_color //
        to: finish_color
        duration: 2500
        running: false //
        onFinished: { current_color = finish_color; }   // по окончании анимации запоминаем финальный цвет, чтоб потом начать с него
    }


    PropertyAnimation {
        id: anim2
        target: rect_cnhange_color
        property: "radius" //
        from: 1
        to: 50
        duration: 1000
        running: false //
    }


    RotationAnimation {
            id: anim3
            target: rect_cnhange_color
            properties: "rotation"
            to: 360
            duration: 4000
            running: false //
    }
}

