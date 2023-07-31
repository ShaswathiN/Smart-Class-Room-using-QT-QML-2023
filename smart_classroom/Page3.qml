import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12

    Pane {
        id:mainscreen
        height:parent.height
        width:parent.width
        anchors.centerIn:parent
        Material.theme:Material.Dark
        Material.accent: Material.Purple
        Rectangle {
            id:rect1
            width: parent.width
            height:50
            anchors.margins: 15
            radius: 10
            color: "#8441A4"



            Text {
                anchors.centerIn: parent
                text: "SMART AUTOMATED CLASSROOM"
                font.pointSize: 12
                font.bold: true
                color: "lavender"

            }
        }


        Rectangle {
            id:rect2
            width:parent.width*0.3
            height:parent.height*0.8
            anchors.top: rect1.bottom
            anchors.margins: 15
            color: "transparent"

            Pane{
                id:humidity
                width:parent.width
                height: parent.height/2
                anchors.top:intro.bottom
                anchors.margins: 5
                Material.elevation: 10

                Label{
                    id:humiditytxt
                    text: "Humidity"
                    font.pixelSize: 15
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                Image {
                    id: drop
                    source: "images/drop.png"
                    width: parent.width*0.7
                    height: parent.height*0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.top: humiditytxt.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label{
                    text: "45 %"
                    font.pixelSize:20
                    anchors.top: drop.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }


            }
            Pane{
                id:roomtemp
                width:parent.width
                height: parent.height/2
                anchors.top: humidity.bottom
                anchors.margins: 10
                Material.elevation: 10
                Label{
                    id:temptxt
                    text: "Room Temperature"
                    font.pixelSize: 15
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                Image {
                    id: tempimg
                    source: "images/thermometer.png"
                    width: parent.width*0.7
                    height: parent.height*0.7
                    fillMode: Image.PreserveAspectFit
                    anchors.top: temptxt.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label{
                    text: "29 °C"
                    font.pixelSize:20
                    anchors.top:tempimg.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }



        }

        Pane{
            width:parent.width*0.7
            height:600
            anchors.left:rect2.right
            anchors.top:rect1.bottom
            anchors.margins: 15



            Grid {
                columns: 3
                rows: 2
                spacing:5
                anchors.fill: parent
                anchors.margins:15

                Pane {
                    id:lightbox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10


                    Image {
                        id: light
                        source: "images/light.png"

                        anchors.fill: parent

                    }
                    Popup {
                        id: popuplight
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark
                        closePolicy: popuplight.NoAutoClose




                        Text{
                            id:lightbulb
                            text: "Light"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 20
                            color: "lavender"

                        }
                        Rectangle{
                            anchors.top: lightbulb.bottom
                            anchors.bottom: slider.top
                            color:"transparent"
                            height:parent.height*0.6
                            width:parent.width*0.5
                            anchors.horizontalCenter:parent.horizontalCenter
                            Image {
                                id: bright
                                source: "images/bright.png"

                                anchors.fill: parent
                            }
                        }

                        Slider {
                            id: slider
                            width: parent.width
                            from: 0
                            to: 10
                            stepSize: 2
                            anchors.centerIn: parent
                            Material.accent: Material.Purple
                            onValueChanged: {
                                console.log("Dial value changed:", value)


                            }

                            Text {
                                id:lightvalue
                                text: slider.value.toFixed(0)
                                font.pixelSize: 20
                                color:"lavender"
                                anchors.top: slider.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Label{
                                text: "Brightness"
                                anchors.top: lightvalue.bottom
                                anchors.margins:5
                                font.pixelSize: 11
                                anchors.horizontalCenter: parent.horizontalCenter

                            }




                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popuplight.close()
                                lightbox.Material.background="#8441A4"


                            }
                        }

                    }
                    Switch {
                        id:switchControl
                        text: qsTr("Light")

                        anchors.right: parent.right
                        onClicked:  {

                            if (switchControl.checked ){
                                popuplight.open()

                            }
                            else{
                                lightbox.Material.background=Material.Black
                            }
                        }
                    }


                }



                Pane {
                    id:fanbox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10
                    Image {
                        id: fan
                        source: "images/fan.png"

                        anchors.fill: parent

                    }
                    Popup {
                        id: popupfan
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark




                        Text{
                            id:fantext
                            text: "Fan"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 22
                            color: "lavender"

                        }

                        Dial {
                            id: fandial
                            anchors.centerIn: parent
                            minimumValue:1
                            maximumValue:5
                            stepSize: 1
                            value: 18 // Initial value
                            Material.background:Material.Purple

                            onValueChanged: {
                                console.log("Dial value changed:", value)


                            }

                            Text {
                                id:fandialtext
                                text: fandial.value.toFixed(0)
                                font.pixelSize: 20
                                color:"purple"
                                anchors.centerIn: parent
                            }
                            Label{
                                text: "speed"
                                font.pixelSize:12
                                anchors.top: fandialtext.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                color:"purple"
                            }




                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popupfan.close()
                                fanbox.Material.background="#8441A4"

                            }
                        }

                    }

                    Switch {
                        id:switchControl1
                        text: qsTr("Fan")
                        anchors.right: parent.right
                        onClicked:  {

                            if (switchControl1.checked){
                                popupfan.open()
                            }
                            else{
                                fanbox.Material.background=Material.Black
                            }
                        }
                    }
                }

                Pane {
                    id:acbox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10

                    Image {
                        id:ac
                        source: "images/ac.png"

                        width: parent.width/2
                        height: parent.height/2
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent



                    }

                    Popup {
                        id: popup
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark




                        Text{
                            id:air
                            text: "Air Contioner"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 20
                            color: "lavender"

                        }
                        Rectangle{
                            anchors.top:air.bottom
                            anchors.bottom: acdial.top
                            color:"transparent"
                            height:parent.height*0.5
                            width:parent.width*0.5
                            anchors.horizontalCenter:parent.horizontalCenter
                            Image {
                                id: snow
                                source: "images/snowflake.png"
                                width: parent.width/2
                                height: parent.height/2
                                fillMode:Image.PreserveAspectFit
                                anchors.centerIn: parent


                            }

                        }
                        Dial {
                            id: acdial
                            anchors.centerIn: parent
                            minimumValue:12
                            maximumValue:30
                            stepSize: 1
                            value: 18 // Initial value
                            Material.background:Material.Purple

                            onValueChanged: {
                                console.log("Dial value changed:", value)


                            }

                            Text {
                                text: acdial.value.toFixed(0) + "°C"
                                font.pixelSize: 20
                                color:"purple"
                                anchors.centerIn: parent
                            }




                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popup.close()
                                acbox.Material.background="#8441A4"

                            }
                        }

                    }

                    Switch {
                        id:switchControl2
                        text: qsTr("AC")
                        anchors.right: parent.right
                        onClicked:  {

                            if (switchControl2.checked==true){
                                popup.open()

                            }
                            else{
                                acbox.Material.background=Material.Black
                            }
                        }

                    }
                }

                Pane {
                    id:projectorbox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10
                    Image {

                        id:projector
                        source: "images/projector.png"
                        width: parent.width/2
                        height: parent.height/2
                        fillMode:Image.PreserveAspectFit
                        anchors.centerIn: parent



                    }
                    Popup{
                        id: popupprojector
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark
                        Text{
                            id:projectortext
                            text: "Vedio"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 20
                            color: "lavender"

                        }

                        Rectangle {
                            id: lcd
                            width: parent.width
                            height: parent.height/2
                            anchors.top:projectortext.bottom
                            color: "black"
                            anchors.centerIn: parent

                            Rectangle {
                                id: lcdD
                                width: parent.width - 10
                                height: parent.height - 10
                                color: "white"
                                anchors.centerIn: parent



                                AnimatedImage{
                                 id:projecttv
                                 width: parent.width
                                 height: parent.height
                                 fillMode: AnimatedImage.PreserveAspectFit
                                 source: "images/video-channel.gif"
                                }
                            }
                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popupprojector.close()
                                projectorbox.Material.background="#8441A4"

                            }
                        }
                    }

                    Switch {
                        id:switchControl3
                        text: qsTr("Projector")
                        anchors.right: parent.right
                        onClicked:  {

                            if (switchControl3.checked){
                                popupprojector.open()
                            }
                            else{
                                projectorbox.Material.background=Material.Black
                            }
                        }
                    }
                }

                Pane{
                    id:speakerbox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10
                    Image {
                        id:speaker
                        source: "images/speaker.png"

                        anchors.fill: parent

                    }
                    Popup {
                        id: popupspeaker
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark




                        Text{
                            id:speakertext
                            text: "Speaker"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 20
                            color: "lavender"

                        }
                        Rectangle{
                            anchors.top: speakertext.bottom
                            anchors.bottom: slidersp.top
                            color:"transparent"
                            height:parent.height*0.6
                            width:parent.width*0.5
                            anchors.horizontalCenter:parent.horizontalCenter
                            Image {
                                id:volume
                                source: "images/volume.png"
                                width: parent.width/2
                                height: parent.height/2
                                fillMode:Image.PreserveAspectFit
                                anchors.centerIn: parent


                            }
                        }

                        Slider {
                            id: slidersp
                            width: parent.width
                            from: 0
                            to: 10
                            stepSize: 2
                            anchors.centerIn: parent
                            Material.accent: Material.Purple
                            onValueChanged: {
                                console.log("Dial value changed:", value)


                            }

                            Text {
                                id:speakervalue
                                text: slidersp.value.toFixed(0)
                                font.pixelSize: 20
                                color:"lavender"
                                anchors.top: slidersp.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Label{
                                text: "Volume"
                                anchors.top: speakervalue.bottom
                                anchors.margins:5
                                font.pixelSize: 11
                                anchors.horizontalCenter: parent.horizontalCenter

                            }




                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popupspeaker.close()
                                speakerbox.Material.background="#8441A4"

                            }
                        }

                    }

                    Switch {
                        id:switchControl4
                        text: qsTr("Speaker")
                        anchors.right: parent.right
                        onClicked:  {

                            if (switchControl4.checked){
                                popupspeaker.open()
                            }
                            else{
                                speakerbox.Material.background=Material.Black
                            }
                        }
                    }
                }

                Pane{
                    id:camerabox
                    width: parent.width *0.3
                    height:parent.height*0.29
                    Material.elevation: 10

                    Image {
                        id:camera
                        source: "images/cctv.png"
                        width: parent.width/2
                        height: parent.height/2
                        fillMode:Image.PreserveAspectFit
                        anchors.centerIn: parent



                    }

                    Popup{
                        id: popupcamera
                        anchors.centerIn: Overlay.overlay
                        width: 200
                        height: 300
                        modal: true
                        focus: true
                        Material.theme:Material.Dark
                        Text{
                            id:cameratext
                            text: "Live Vedio"
                            anchors.horizontalCenter:parent.horizontalCenter
                            font.pixelSize: 20
                            color: "lavender"

                        }

                        Rectangle {
                            id: lcdBackground
                            width: parent.width
                            height: parent.height/2
                            anchors.top:cameratext.bottom
                            color: "black"
                            anchors.centerIn: parent

                            Rectangle {
                                id: lcdDisplay
                                width: parent.width - 10
                                height: parent.height - 10
                                color: "white"
                                anchors.centerIn: parent

                                // Add any additional styling properties to the LCD display

                                AnimatedImage{
                                 id:tv
                                 width: parent.width
                                 height: parent.height
                                 fillMode: AnimatedImage.PreserveAspectFit
                                 source: "images/tv.gif"
                                }
                            }
                        }
                        Button {
                            text: qsTr("ok")
                            highlighted: true
                            Material.background: Material.Purple
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter:parent.horizontalCenter
                            onClicked: {

                                popupcamera.close()
                                camerabox.Material.background="#8441A4"

                            }
                        }
                    }

                    Switch {
                        id:switchControl5
                        text: qsTr("Camera")
                        anchors.right:parent.right
                        onClicked:  {

                            if (switchControl5.checked)
                                popupcamera.open()

                            else{
                                camerabox.Material.background=Material.Black
                            }
                        }
                    }

                }
            }
        }

    }








