import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5


ApplicationWindow {
    id:_root
    width: 360
    height: 640
    //    width: Screen.width
    //    height: Screen.height
    visible: true
    title: qsTr("Mobile Application")

    Image {
        id: lap_assets_bg_img
        source:"ApplicationImages/backgroundimg/updateemp.jpeg"
        anchors.fill: parent
    }
    Loader{
        id:_load
    }

    Firstscreen{

    }
//    AuthorityServicepage{

//    }
//    AuthorityAssetsProvidePage{

//    }

    Component.onCompleted: {
        console.log("Mainpage Construction")
    }
    Component.onDestruction: {
        console.log("Mainpage Distruction")
    }


}
