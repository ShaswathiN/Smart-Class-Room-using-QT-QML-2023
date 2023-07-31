import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Dialogs 1.3

Pane {
    height:parent.height
    width:parent.width
    anchors.centerIn:parent
    property string activeTextField: ""

    Pane{
        id:mainArea
        width:parent.width*0.4
        height: parent.height*0.8
        anchors.centerIn: parent
        Material.elevation: 10


        ColumnLayout {
            anchors.centerIn: parent
            width:parent.width
            height:parent.height
            spacing: 15
            RowLayout{
                spacing:5
                width:parent.width


                Label {
                    text: "Select a Block:"
                    font.bold: true
                    color: "lavender"
                }

                ComboBox {
                    id:comboBox
                    model:form.getComboBoxData();

                    onCurrentTextChanged: {
                        comboBox1.model=form.getComboBoxData1(comboBox.currentText);
                    }





                }
            }
            RowLayout{
                spacing:5



                Label {
                    text: "Select a classroom:"
                    font.bold: true
                    color: "lavender"
                }

                ComboBox {
                    id: comboBox1



                }
            }
            RowLayout{
                spacing: 5
                Label {
                    text: "Select a Date:"
                    font.bold: true
                    color: "lavender"
                }
                TextField {
                    id: dateField
                    Layout.columnSpan: 7
                    Layout.row: 1
                    readOnly: true
                    placeholderText: "Choose a date:"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            datePickerDialog.visible = true
                            datePickerDialog.open()
                        }
                    }
                }

            }
            Dialog {
                id: datePickerDialog
                title: "Select a Date"

                contentItem: Calendar {
                    id: calendar
                    selectedDate: new Date() // Set initial selected date to the current date
                    onSelectedDateChanged: {
                        dateField.text = selectedDate.toLocaleDateString(Qt.locale(), "dd-MM-yyyy")
                        datePickerDialog.close()
                    }
                }
            }
            Label{
                text: "Select a time:"
                font.bold: true
                color: "lavender"


            }
            RowLayout{
                TextField {
                    id: timestart
                    width: parent.width/2
                    height: parent.height
                    placeholderText: "start time"
                    readOnly: true

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            timePicker.visible = true
                            activeTextField = "timestart";
                            timePicker.open()
                        }
                    }
                }
                TextField {
                    id: timestop
                    width: parent.width/2
                    height: parent.height
                    placeholderText: "Click  time"

                    readOnly: true

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            timePicker.visible = true
                            activeTextField = "timestop";
                            timePicker.open()
                        }
                    }
                }
            }

            Popup {
                id: timePicker
                width: 200
                height: 200
                focus: true
                visible: false

                ColumnLayout {
                    id: pickerContent
                    width: parent.width
                    height: parent.height
                    spacing: 10
                    //padding: 10


                    Row {
                        spacing: 5

                        Tumbler {
                            id: hourTumbler
                            width: 50
                            height:100
                            model: 12
                        }

                        Label {
                            text: ":"
                        }

                        Tumbler {
                            id: minuteTumbler
                            width: 50
                            height:100
                            model: 60
                        }
                        Label {
                            text: ":"
                        }
                        Tumbler {
                            id: ampmTumbler
                            width: 70
                            height: 100
                            model: ["AM", "PM"]
                        }


                    }
                    Button {
                        text: "OK"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            var selectedHour = hourTumbler.currentIndex
                            var selectedMinute = minuteTumbler.currentIndex
                            var selectedAmPm = ampmTumbler.model[ampmTumbler.currentIndex]
                            var hourString = selectedHour.toString().padStart(2, '0')
                            var minuteString = selectedMinute.toString().padStart(2, '0')


                            var time = hourString + ":" + minuteString
                            console.log("Selected Time:", time, selectedAmPm)
                            if (activeTextField === "timestart"){
                                timestart.text = time +" "+ selectedAmPm
                                timePicker.close()
                            }
                            else if(activeTextField === "timestop"){
                                timestop.text = time +" "+ selectedAmPm
                                timePicker.close()
                            }

                        }
                    }
                }
            }

            Button {
                id:loginbtn
                anchors.leftMargin:15

                anchors.top:calender.bottom
                anchors.topMargin: 20
                height:parent.height/8
                Layout.fillWidth: true
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
                    text: qsTr("DONE")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    color:"lavender"

                }
                onClicked: {
                    form.submitform(comboBox.displayText,comboBox1.displayText,dateField.displayText,timestart.displayText,timestop.displayText)
                }

            }
            Connections {
                target: form
                onInsertSuccessfull: {

                    openNewPage1();
                }
                onDuplicate:{
                     duplicate();
                }
            }


        }
    }

}
