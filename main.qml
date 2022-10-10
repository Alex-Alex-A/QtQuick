import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


Window {
    id: primaryFrame
    width: 540
    height: 520
    visible: true
    title: qsTr("Creating Date Account")
    color: "#e5ecef"

    property string gsex: ""

    function accountDetails() {

        var fn = fname.text
        var sn = sname.text
        var age = fage.text

        if (fn.length < 1 || sn.length < 1 || age.length < 1 || gsex == "") {
            console.log("Fields must not be empty!!!")
            return
        }

        if (isNaN(age)) {
            console.log("Age must be a number!!!")
            return
        }

        console.log("\n     Your first name:  " + fn)
        console.log("Your second name:  " + sn)
        console.log("Your age:  " + age)
        console.log("Your sex:  " + gsex)
    }



    Column {
        anchors.fill: parent
        padding: 62
        spacing: 62

        Row {
            anchors.fill: parent

            Label {
                text: "Type Your First Name"
                verticalAlignment: "AlignVCenter"
                topPadding: 8
                leftPadding: 50
            }

            TextField {
                id: fname
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("First Name")
                Keys.onEnterPressed: accountDetails()
                Keys.onReturnPressed: accountDetails()
            }
        }

        Row {
            anchors.fill: parent
            anchors.topMargin: 46

            Label {
                text: "Type Your Second Name"
                verticalAlignment: "AlignVCenter"
                topPadding: 8
                leftPadding: 50
            }

            TextField {
                id: sname
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Second Name")
                Keys.onEnterPressed: accountDetails()
                Keys.onReturnPressed: accountDetails()
            }
        }

        Row {
            anchors.fill: parent
            anchors.topMargin: 92

            Label {
                text: "Type Your Age"
                verticalAlignment: "AlignVCenter"
                topPadding: 8
                leftPadding: 50
            }

            TextField {
                id: fage
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Age")
                Keys.onEnterPressed: accountDetails()
                Keys.onReturnPressed: accountDetails()
            }
        }

        Row {
            anchors.fill: parent
            anchors.topMargin: 138
            leftPadding: 50

            Label {
                text: "Type Your Sex"
                verticalAlignment: "AlignVCenter"
                topPadding: 8
                rightPadding: 50
            }

            ComboBox {
                width: 200
                currentIndex: 0
                textRole: "key"
                model: ListModel {
                    id: fsex
                    ListElement { key: "" }
                    ListElement { key: "Male" }
                    ListElement { key: "Female" }
                }

                onCurrentIndexChanged: gsex = fsex.get(currentIndex).key
            }
        }



        Row {
            anchors.fill: parent
            anchors.topMargin: 192

            Button {
                        id: submitButton
                        width: 200
                        height: 40
                        background: Rectangle {
                        color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                        }

                        text: qsTr("Create Account")
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: accountDetails()
            }
        }
    }

}

