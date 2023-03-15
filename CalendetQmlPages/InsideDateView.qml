import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id:daterect
    height: parent.height/9
    width: parent.width/7.8
    color: "black"
    radius: daterect.height/2
    Label{
        id:dateText
        text: modelData
        font.pixelSize: parent.width/4
        anchors.centerIn: parent
        color: "#ffffff"
    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            daterect.color="#ffffff"
            dateText.color="black"
            console.log("detarect Pressed")
        }
        onReleased: {
            daterect.color="black"
            dateText.color="#ffffff"
            console.log("detarect Released")
        }
        onClicked: {
            console.log("Daterect Clicked")
            console.log("Date= "+dateText.text)
        }
    }
    Component.onCompleted: {
        console.log("Inside DateView Page Construction")
    }
    Component.onDestruction: {
        console.log("Inside Date View Page Distruction")
    }
}
