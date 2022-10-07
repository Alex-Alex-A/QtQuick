import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


Window {
    id: primaryFrame
    width: 640
    height: 480
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

        var a = Number(sideA.text)
        var b = Number(sideB.text)
        var c = Number(sideC.text)

        var p = (a + b + c) / 2.0

        var s = Math.sqrt(  p * (p - a) * (p - b) * (p - c)      )

        return s.toString()
    }



    Column {
        anchors.fill: parent
        padding: 32
        spacing: 32

        TextField {
            id: sideA
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("sideA")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: sideB
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("sideB")
            Keys.onEnterPressed: calcSquare()
            Keys.onReturnPressed: calcSquare()
        }

        TextField {
            id: sideC
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("sideC")
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

