import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:bagassets
    width: _root.width
    height: _root.height
    Text {
        id: heading
        text: "Bag Deatails"
        font.bold: true
        font.pixelSize: bagassets.width/15
        font.family: "Helvetica"
        color: "#252525"
        anchors.top: bagassets.top
        anchors.topMargin: bagassets.height/18
        anchors.horizontalCenter: bagassets.horizontalCenter
    }

    Item {
        id: lapicon
        width: bagassets.width/5
        height: bagassets.height/7
        anchors.top: heading.bottom
        anchors.topMargin: heading.height/2
        anchors.horizontalCenter: heading.horizontalCenter
        Image {
            id: lapimg
            source: "ApplicationImages/icons/bag.png"
            anchors.fill: parent

        }
    }
    ColumnLayout{
        id:bag_deatails_col_layout
        spacing: bagassets.height/70
        anchors.centerIn: parent
        TxtField{
            id:lap_bag_name_txt_field
            textFieldWidth: bagassets.width/1.3
            textFieldHeight: bagassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Bag Name"
            fontSize: lap_bag_name_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:lap_bag_id_txt_field
            textFieldWidth: bagassets.width/1.3
            textFieldHeight: bagassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Bag id"
            fontSize: lap_bag_id_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:any_damege_txt_field
            textFieldWidth: bagassets.width/1.3
            textFieldHeight: bagassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Any Damage"
            fontSize: any_damege_txt_field.width/15
            fontbold: true

        }


    }
    Button{
        id:submit_button
        width: bagassets.width/1.8
        height: bagassets.height/13
        anchors.top: bag_deatails_col_layout.bottom
        anchors.topMargin: bagassets.height/9
        anchors.horizontalCenter: bag_deatails_col_layout.horizontalCenter
        Text {
            id: submit_button_txt
            text: "Submit"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: submit_button.width/10
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:submit_button_bg_rect
            anchors.fill: parent
            color: "black"
            radius: submit_button.width/20
        }
        onPressed: {
            submit_button_bg_rect.color="#FAF9F8"
            submit_button_txt.color="#635AD9"
        }
        onReleased: {
            submit_button_bg_rect.color="black"
            submit_button_txt.color="#FAF9F8"
        }
        onClicked: {
            console.log("Laptop Bag Assets Submit  Button Clicked")
            AssetsDatabase.storeBagAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,lap_bag_name_txt_field.textt,lap_bag_id_txt_field.textt,any_damege_txt_field.textt);
            if(AssetsDatabase.messegePopQml){
                console.log("bag Assets Successfully Added")
                bag_assets_add_successful.visible=true
            }
            else{
                bag_assets_add_unsuccessful.visible=true
                console.log("Bag Id and Name Mandatory")
            }
        }
    }

    Button{
        id:backbutton
        width: bagassets.width/7
        height: bagassets.height/13
        anchors.top: bagassets.top
        anchors.topMargin: bagassets.height/30
        anchors.left: bagassets.left
        background: Rectangle{
            id:back_button_bg_rect
            anchors.fill: parent
            color: "transparent"
            radius: backbutton.width/30
            Image {
                id: back_img
                anchors.fill: parent
                source: "ApplicationImages/icons/previous.png"
            }
        }
        onPressed: {
            back_button_bg_rect.color="#FAF9F8"

        }
        onReleased: {
            back_button_bg_rect.color="transparent"

        }
        onClicked: {
            console.log("Authority Assets Provide Page Back Button Clicked")
            _load.source="AuthorityAssetsProvidePage.qml"
            bagassets.visible=false

        }
    }

    MessageDialog{
        id:bag_assets_add_successful
        text: "Bag Assets Successfully Added"
    }
    MessageDialog{
        id:bag_assets_add_unsuccessful
        text:"Bag Id And Name Mandatary\n(or)This Employee Already have Assets"
    }
    Component.onCompleted: {
        console.log("Laptop Bag Assets Page Constructor")
    }
    Component.onDestruction: {
        console.log("Loptop Bag Assets Page Distruction")
    }

}
