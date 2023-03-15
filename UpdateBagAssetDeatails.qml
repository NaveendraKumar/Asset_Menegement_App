import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:update_bag_assets
    width: _root.width
    height: _root.height
    Image {
        id: bgimg
        source: "ApplicationImages/backgroundimg/updateemp.jpeg"
        anchors.fill: parent
    }
    Text {
        id: heading
        text: "Update Bag Deatails"
        font.bold:true
        font.family: "Helvetica"
        font.pixelSize: update_bag_assets.width/16
        anchors.horizontalCenter: update_bag_assets.horizontalCenter
        anchors.top: update_bag_assets.top
        anchors.topMargin: update_bag_assets.height/30
    }

    Item {
        id: bag_img_item
        width: update_bag_assets.width/3.5
        height: update_bag_assets.height/6
        anchors.top: heading.bottom
        anchors.horizontalCenter: heading.horizontalCenter
        anchors.topMargin: update_bag_assets.height/30
        Image {
            id: laptop_img
            source: "ApplicationImages/icons/bag.png"
            anchors.fill: parent
        }
    }
    ColumnLayout{
        id:bag_deatails_col_layout
        spacing: update_bag_assets.height/70
        anchors.centerIn: parent
        TxtField{
            id:bag_name_txt_field
            textFieldWidth: update_bag_assets.width/1.3
            textFieldHeight: update_bag_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Bag Name"
            fontSize: bag_name_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:bag_id_txt_field
            textFieldWidth: update_bag_assets.width/1.3
            textFieldHeight: update_bag_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Bag id"
            fontSize: bag_id_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:any_damege_txt_field
            textFieldWidth: update_bag_assets.width/1.3
            textFieldHeight: update_bag_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Any Damage"
            fontSize: any_damege_txt_field.width/15
            fontbold: true

        }

    }
    Button{
        id:back_button
        width: update_bag_assets.width/7
        height: update_bag_assets.height/13
        anchors.top: update_bag_assets.top
        anchors.topMargin: update_bag_assets.height/70
        anchors.left: update_bag_assets.left
        background: Rectangle{
            id:back_button_rect
            anchors.fill: parent
            radius: back_button.width/20
            color: "transparent"
            Image {
                id: back_img
                anchors.fill: parent
                source: "ApplicationImages/icons/previous.png"
            }
        }
        onPressed: {
            back_button_rect.color="#FAF9F8"
        }
        onReleased: {
            back_button_rect.color="black"
        }
        onClicked: {
            console.log("Update Bag Asset page Back button Clicked")
            _load.source="UpdateAssetsDeatails.qml"
            update_bag_assets.visible=false
        }
    }
    Button{
        id:submitbutton
        width: update_bag_assets.width/1.8
        height: update_bag_assets.height/13
        anchors.top: bag_deatails_col_layout.bottom
        anchors.topMargin: bag_deatails_col_layout.height/2
        anchors.horizontalCenter: bag_deatails_col_layout.horizontalCenter
        Text {
            id: submit_button_txt
            text: "Submit"
            font.bold: true
            font.pixelSize: submitbutton.width/10
            font.family: "Helvetica"
            anchors.centerIn: parent
            color: "#FAF9F8"
        }
        background: Rectangle{
            id:submit_button_rect
            anchors.fill: parent
            radius: submitbutton.width/20
            color: "black"
        }
        onPressed: {
            submit_button_rect.color="#FAF9F8"
            submit_button_txt.color="#635AD9"
        }
        onReleased: {
            submit_button_rect.color="black"
            submit_button_txt.color="#FAF9F8"
        }
        onClicked: {
            console.log("Update Bag Asset page Submit button Clicked")
            AssetsDatabase.updateBagAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,bag_name_txt_field.textt,bag_id_txt_field.textt,any_damege_txt_field.textt);
            if(AssetsDatabase.messegePopQml){
                updatesuccess.visible=true
                console.log("Bag Assets Update Success")
                _load.source="AuthorityServicepage.qml"
            }
            else{
                console.log("Employee Does't have any Assets")
                updatefail.visible=true
            }
        }
    }
    MessageDialog{
        id:updatesuccess
        text: "Bag Assets Updated"
    }
    MessageDialog{
        id:updatefail
        text: "Current Employee Does't have bag Assets"
    }
    Component.onCompleted: {
        console.log("Update Bag Assetts Deatails Page Construction")
    }
    Component.onDestruction: {
        console.log("Update Bag Assets Deatails Page Distruction")
    }
}
