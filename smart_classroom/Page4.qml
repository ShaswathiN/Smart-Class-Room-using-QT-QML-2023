import QtQuick 2.15
import QtGraphicalEffects 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.15


Pane{
    height:parent.height
    width:parent.width
    anchors.centerIn:parent

    Pane{
        id:mainArea
        width:parent.width*0.4
        height: parent.height*0.8
        anchors.centerIn: parent
        Material.elevation: 10
        Item {
            width: 200
            height:100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            TextField {
                id:door1
                anchors.centerIn: parent
                placeholderText:qsTr("Enter Password")
                readOnly: true
                echoMode: TextInput.Password
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


        Grid{
            id:grid
            columns: 3
            rows: 4
            columnSpacing: 5
            rowSpacing: 5
            anchors.centerIn: parent

            Button {
                id:one
                text: "1"
                onClicked: {
                    door1.text = door1.text +"1"

                }
            }
            Button {
                id:two
                text: "2"
                onClicked: {
                    door1.text = door1.text + "2"
                }
            }
            Button {
                id:three
                text: "3"
                onClicked: {
                    door1.text = door1.text +"3"
                }
            }
            Button {
                id:four
                text: "4"
                onClicked: {
                    door1.text =door1.text + "4"
                }
            }
            Button {
                id:five
                text: "5"
                onClicked: {
                    door1.text = door1.text +"5"
                }
            }
            Button {
                id:six
                text: "6"
                onClicked: {
                    door1.text =door1.text + "6"
                }
            }
            Button {
                id:seven
                text: "7"
                onClicked: {
                    door1.text = door1.text +"7"
                }
            }
            Button {
                id:eight
                text: "8"
                onClicked: {
                    door1.text = door1.text +"8"
                }
            }
            Button {
                id:nine
                text: "9"
                onClicked: {
                    door1.text = door1.text +"9"
                }
            }
            Button {
                id:natchathiram
                text: "*"
                onClicked: {
                    door1.text = door1.text +"*"
                }
            }
            Button {
                id:zero
                text: "0"
                onClicked: {
                    door1.text = door1.text +"0"
                }
            }
            Button {
                id:hash
                text: "#"
                onClicked: {
                    door1.text = door1.text +"#"
                }
            }


        }
        RowLayout{
            Layout.fillWidth: true
            anchors.top:grid.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            Button{
                id:ok
                text:"OK"
                onClicked:doorobj.doorcode(door1.text)



            }
            Button{
                id:cancel
                text:"cancel"

                    onClicked: {
                        var text = door1.text
                        if (text.length > 0) {
                            text = text.substring(0, text.length - 1)
                        }
                        door1.text = text
                    }

                }
            Connections {
                   target: doorobj
                   onDoorlock: {

                       openNewPage2();
                   }
            }

            }
        }
    }


