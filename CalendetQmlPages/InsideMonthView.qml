import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle{
    signal presentMonth();
    property bool defaultStatus: false
    property bool currentMonth: false
    property int indexvalue;
    width: root.width
    height: root.height/1.5
    color: "black"
    Column{
        spacing: 10
        Text {
            id: mnth_name2
            text:monthname
            font.pixelSize:parent.width/20
            color: currentMonth?"blue":"#ffffff"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("Month Name : "+mnth_name2.text)
                }
            }
        }
        Row{
            spacing: parent.width/8.7
            anchors.left: parent.left
            anchors.leftMargin: parent.width/25
            Label{
                text: "S"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "M"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "T"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "W"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "T"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "F"
                color: "grey"
                font.pixelSize: parent.width/30
            }
            Label{
                text: "S"
                color: "grey"
                font.pixelSize: parent.width/30
            }
        }
        GridView{
            model: monthdata
            id: dateRect2
            width:root.width
            height: root.height
            cellHeight: parent.height/12
            cellWidth: parent.width/7.8
            clip: true
            delegate: InsideDateView{}
        }
    }

    MouseArea{
        anchors.fill: mnth_name2
        onClicked: {
            presentMonth()
        }
    }
    Component.onCompleted: {
        console.log("Inside Month View Construction")
    }
    Component.onDestruction: {
        console.log("Inside Month View Page Distruction")
    }
}
