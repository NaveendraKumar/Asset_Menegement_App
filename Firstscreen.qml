import QtQuick 2.0

Item {
    id:_firstscreen
    anchors.fill: parent
    Item{
        id:_logo
        width: _firstscreen.width/1.02
        height: _firstscreen.height/2.5
        anchors.centerIn: parent
        Image {
            id: togglescreenimage
            anchors.fill: parent
            source: "ApplicationImages/icons/Pthinks.png"
        }
    }
    Timer{
        running: true
        interval: 5000
        onTriggered:{
            _firstscreen.visible=false
            _load.source="AuthorityLoginpage.qml"
        }

    }

    Component.onCompleted: {
        console.log("TaggleScreen(FirstScrenn) page Constructed")

    }
    Component.onDestruction: {
        console.log("TaggleScreen(FirstScrenn) page Distructed")
    }


}
