import QtQuick 2.0

Text {
    id: dateText
    text: modelData
    font.pixelSize: parent.width/14
    color: "#ffffff"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log("datetxt="+dateText.text)
        }
    }

    Component.onCompleted: {
        console.log(" DateView Page Construction data====",i++)
    }
    Component.onDestruction: {
        console.log("DateView Page Distruction")
    }
}
