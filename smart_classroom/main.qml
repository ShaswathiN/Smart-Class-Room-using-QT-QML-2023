import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: "main"

    Material.theme: Material.Dark
    Material.accent: Material.Purple
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage
        function openNewPage() {
            // Push a new page into the stack
            stackView.push(page2);
        }
        function openpopup() {
            loginfail.open()

        }

        Popup {
            id:loginfail
            anchors.centerIn: Overlay.overlay
            width: 300
            height: 100
            modal: true
            focus: true
            Material.theme:Material.Dark
            Text {
                id: error
                text: qsTr("Incorrect username or password")
                font.pixelSize: 15
                anchors.horizontalCenter:parent.horizontalCenter
                color: "lavender"

            }
            Button {
                text: qsTr("ok")
                highlighted: true
                Material.background: Material.Purple
                anchors.top:  error.bottom
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: {

                    loginfail.close()


                }


            }



        }

    }
    Component {
        id: loginPage
        LoginPage {


        }
    }


    Component {
        id: page2
        Page2 {
            function openNewPage1() {
                // Push a new page into the stack
                stackView.push(door);
            }
            function duplicate(){
                  duplicatepopup.open();
            }
            Popup {
                id:duplicatepopup
                anchors.centerIn: Overlay.overlay
                width: 300
                height: 100
                modal: true
                focus: true
                Material.theme:Material.Dark
                Text {
                    id: error
                    text: qsTr("Already booked")
                    font.pixelSize: 15
                    anchors.horizontalCenter:parent.horizontalCenter
                    color: "lavender"

                }
                Button {
                    text: qsTr("ok")
                    highlighted: true
                    Material.background: Material.Purple
                    anchors.top:  error.bottom
                    anchors.horizontalCenter:parent.horizontalCenter
                    onClicked: {

                        duplicatepopup.close()


                    }


                }
            }
        }
    }

    Component {
        id:door
        Page4{
            function openNewPage2() {
                // Push a new page into the stack
                stackView.push(dashboard);
            }
        }
    }
    Component {
        id: dashboard
        Page3 {

        }
    }
}


