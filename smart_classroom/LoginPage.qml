import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.15

Pane
{

    height:parent.height
    width:parent.width
    anchors.centerIn: parent

    Pane{
        id:mainArea
        width:parent.width*0.4
        height: parent.height*0.8
        Material.elevation: 10
        anchors.centerIn: parent


        Image{
            id:loginlogo
            height:parent.height/4
            anchors.top:parent.top
            source:"images/login.png"
            fillMode: Image.PreserveAspectFit
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50

        }
        Rectangle{

            id:inputArea
            height:350
            anchors.left:parent.left
            anchors.leftMargin: 25
            anchors.right:parent.right
            anchors.rightMargin:25
            anchors.top: loginlogo.bottom
            anchors.topMargin: 25
            color:"transparent"

            TextField{
                id:username
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.top:parent.top
                height:parent.height/8
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                placeholderText: "UserName"
                placeholderTextColor: "#c785ec"
                color:"lavender"

                background: Rectangle{
                    id:borderbottom
                    width:parent.width
                    height:1
                    anchors.bottom: parent.bottom
                    color:"#a86add"
                }

            }
            TextField{
                id:userPassword
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.top:username.bottom
                anchors.topMargin: 30
                height:parent.height/8
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                placeholderText: "Password"
                placeholderTextColor: "#c785ec"
                color: "lavender"
                echoMode: TextInput.Password
                background: Rectangle{
                    id:borderBottom1
                    width:parent.width
                    height:1
                    anchors.bottom: parent.bottom
                    color: "#a86add"
                }

            }


            Button {
                id:loginbtn
                anchors.left:parent.left
                anchors.right:parent.right
                anchors.top:userPassword.bottom
                anchors.topMargin: 30
                height:parent.height/8
                background: Rectangle{
                    id:loginbtnbg
                    width:parent.width
                    height:parent.width
                    color:loginbtn.hovered ? "#c785ec" : "#a86add"
                    border.width:loginbtn.down ? 3:0
                    radius:10

                }
                contentItem: Text {
                    id: loginbtntext
                    text: qsTr("LOG IN")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    color:"lavender"

                }


                onClicked:{classA.verifyLogin(username.text,userPassword.text)}




            }


            Connections {
                   target: classA
                   onLoginSuccessfull: {

                       openNewPage();
                   }
                   onLoginfailed:{
                       openpopup();
                   }
            }
        }

    }


}
