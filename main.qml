import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


Window {
    id: primaryFrame
    width: 640
    height: 520
    visible: true
    title: qsTr("Triangle Calculations")
    color: "#e5ecef"

    Dialog {
        id: customDialog
        title: "Square is:"
        standardButtons: StandardButton.Ok

        Column {
            anchors.fill: parent
            Text {
                text: calcSquare()
            }
            TextInput {
                id: edtInput
            }
        }

        onButtonClicked: {
            if (clickedButton === StandardButton.Ok) {
                lblResults.text += edtInput.text
            } else {
            }
        }
    }


    function calcSquare() {

        var a = Math.sqrt((Math.pow((Number(pointAx.text) - Number(pointBx.text)), 2.0) + Math.pow((Number(pointAy.text) - Number(pointBy.text)), 2.0)))
        var b = Math.sqrt((Math.pow((Number(pointCx.text) - Number(pointBx.text)), 2.0) + Math.pow((Number(pointCy.text) - Number(pointBy.text)), 2.0)))
        var c = Math.sqrt((Math.pow((Number(pointAx.text) - Number(pointCx.text)), 2.0) + Math.pow((Number(pointAy.text) - Number(pointCy.text)), 2.0)))

        var p = (a + b + c) / 2.0

        var s = Math.sqrt(  p * (p - a) * (p - b) * (p - c)      )

        return s.toString()
    }



    Column {
        anchors.fill: parent
        padding: 32
        spacing: 32

        TextField {
            id: pointAx
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointAx")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: pointAy
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointAy")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: pointBx
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointBx")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: pointBy
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointBy")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: pointCx
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointCx")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: pointCy
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("pointCy")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        Button {
                        id: submitButton
                        width: 200
                        height: 40
                        background: Rectangle {
                        color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                        }

                        text: qsTr("Calculate")
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: customDialog.open()
        }
    }

}

