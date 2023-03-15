import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:update_laptop_assets
    width: _root.width
    height: _root.height

    Text {
        id: heading
        text: "Update Laptop Deatails"
        font.bold:true
        font.family: "Helvetica"
        font.pixelSize: update_laptop_assets.width/16
        color: "#252525"
        anchors.horizontalCenter: update_laptop_assets.horizontalCenter
        anchors.top: update_laptop_assets.top
        anchors.topMargin: update_laptop_assets.height/30
    }

    Item {
        id: laptop_img_item
        width: update_laptop_assets.width/4
        height: update_laptop_assets.height/6
        anchors.top: heading.bottom
        anchors.horizontalCenter: heading.horizontalCenter
        anchors.topMargin: update_laptop_assets.height/35
        Image {
            id: laptop_img
            source: "ApplicationImages/icons/lapicon.png"
            anchors.fill: parent
        }
    }
    ColumnLayout{
        id:lap_deatails_col_layout
        spacing: update_laptop_assets.height/60
        anchors.bottom: update_laptop_assets.bottom
        anchors.horizontalCenter: update_laptop_assets.horizontalCenter
        anchors.bottomMargin: update_laptop_assets.height/4
        TxtField{
            id:lap_name_txt_field
            textFieldWidth: update_laptop_assets.width/1.3
            textFieldHeight: update_laptop_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Laptop Name"
            fontSize: lap_name_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:lap_id_txt_field
            textFieldWidth: update_laptop_assets.width/1.3
            textFieldHeight: update_laptop_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Laptop id"
            fontSize: lap_id_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:any_damege_txt_field
            textFieldWidth: update_laptop_assets.width/1.3
            textFieldHeight: update_laptop_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Any Damage"
            fontSize: any_damege_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:approval_date_txt_field
            textFieldWidth: update_laptop_assets.width/1.3
            textFieldHeight: update_laptop_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Issue date"
            fontSize: approval_date_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:due_date_txt_field
            textFieldWidth: update_laptop_assets.width/1.3
            textFieldHeight: update_laptop_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Due date"
            fontSize: due_date_txt_field.width/15
            fontbold: true

        }

    }

    Button{
        id:back_button
        width: update_laptop_assets.width/7
        height: update_laptop_assets.height/13
        anchors.top: update_laptop_assets.top
        anchors.topMargin: update_laptop_assets.height/70
        anchors.left: update_laptop_assets.left
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
            console.log("Update Laptop Asset page Back button Clicked")
            _load.source="UpdateAssetsDeatails.qml"
            update_laptop_assets.visible=false
        }
    }
    Button{
        id:submitbutton
        width: update_laptop_assets.width/1.8
        height: update_laptop_assets.height/13
        anchors.top: lap_deatails_col_layout.bottom
        anchors.horizontalCenter: lap_deatails_col_layout.horizontalCenter
        anchors.topMargin: update_laptop_assets.height/10
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
            console.log("Update Laptop Asset page Submit button Clicked")
            AssetsDatabase.updateLaptopAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,lap_name_txt_field.textt,lap_id_txt_field.textt,any_damege_txt_field.textt,approval_date_txt_field.textt,due_date_txt_field.textt);
            if(AssetsDatabase.messegePopQml){
                updatesuccess.visible=true
                console.log("Laptop Assets Update Success")
                _load.source="AuthorityServicepage.qml"
                //                    update_laptop_assets.visible=false
            }
            else{
                console.log("Employee Does't have any Assets")
                updatefail.visible=true
            }
        }
    }

    MessageDialog{
        id:updatesuccess
        text: "Laptop Deatails Successfully Update"
    }
    MessageDialog{
        id:updatefail
        text: "Current Employee Does't Have Any Laptop Assets or\n Laptop id, Name Mandatory"
    }

    Component.onCompleted: {
        console.log("Update Laptop Assetts Deatails Page Construction")
    }
    Component.onDestruction: {
        console.log("Update Laptop Assets Deatails Page Distruction")
    }
}
