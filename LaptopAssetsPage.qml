import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:laptopassets
    width: _root.width
    height: _root.height
    property int date: new Date().getDate()
    property int month: new Date().getMonth()+1
    property int year: new Date().getFullYear()+1
    Text {
        id: heading
        text: "Laptop Deatails"
        font.bold: true
        font.pixelSize: laptopassets.width/14
        font.family: "Helvetica"
        color: "#252525"
        anchors.top: laptopassets.top
        anchors.topMargin: laptopassets.height/20
        anchors.horizontalCenter: laptopassets.horizontalCenter
    }
    Item {
        id: lapicon
        width: laptopassets.width/5
        height: laptopassets.height/8
        anchors.top: heading.bottom
        anchors.topMargin: laptopassets.height/19
        anchors.horizontalCenter: heading.horizontalCenter
        Image {
            id: lapimg
            source: "ApplicationImages/icons/lapicon.png"
            anchors.fill: parent

        }
    }

    ColumnLayout{
        id:lap_deatails_col_layout
        spacing: laptopassets.height/70
        anchors.top: lapicon.bottom
        anchors.topMargin: laptopassets.height/40
        anchors.horizontalCenter: lapicon.horizontalCenter
        TxtField{
            id:lap_name_txt_field
            textFieldWidth: laptopassets.width/1.3
            textFieldHeight: laptopassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Laptop name"
            fontSize: lap_name_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:lap_id_txt_field
            textFieldWidth: laptopassets.width/1.3
            textFieldHeight: laptopassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Laptop id"
            fontSize: lap_id_txt_field.width/15
            fontbold: true

        }

        TxtField{
            id:any_damege_txt_field
            textFieldWidth: laptopassets.width/1.3
            textFieldHeight: laptopassets.height/15
            textFieldIcon:"ApplicationImages/icons/laptopdamage.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Any Damage"
            fontSize: any_damege_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:approval_date_txt2
            textFieldWidth: laptopassets.width/1.3
            textFieldHeight: laptopassets.height/15
            textFieldIcon:"ApplicationImages/icons/calender.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Issue date"
            fontSize: approval_date_txt2.width/15
            fontbold: true

        }
        TxtField{
            id:due_date_txt2
            textFieldWidth: laptopassets.width/1.3
            textFieldHeight: laptopassets.height/15
            textFieldIcon:"ApplicationImages/icons/calender.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Due date"
            fontSize: due_date_txt2.width/15
            fontbold: true

        }

    }

    Button{
        id:submit_button
        width: laptopassets.width/1.8
        height: laptopassets.height/13
        anchors.top: lap_deatails_col_layout.bottom
        anchors.topMargin: laptopassets.height/10
        anchors.horizontalCenter: lap_deatails_col_layout.horizontalCenter
        Text {
            id: submit_button_txt
            text: "Submit"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: submit_button.width/9
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
            console.log("Laptop Assets Submit  Button Clicked")
            AssetsDatabase.storeLaptopAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,lap_name_txt_field.textt,lap_id_txt_field.textt,any_damege_txt_field.textt,approval_date_txt2.textt,due_date_txt2.textt);
            if(AssetsDatabase.messegePopQml){
                console.log("Laptop Assets Successfully Added")
                laptop_assets_add_successful.visible=true
            }
            else{
                laptop_assets_add_unsuccessful.visible=true
                console.log("Laptop Id and Name Mandatory")
            }
        }
    }


    Button{
        id:backbutton
        width: laptopassets.width/7
        height: laptopassets.height/13
        anchors.top: laptopassets.top
        anchors.topMargin: laptopassets.height/30
        anchors.left: laptopassets.left
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
            laptopassets.visible=false

        }
    }

    MessageDialog{
        id:laptop_assets_add_successful
        text: "Laptop Assets Successfully Added"
    }
    MessageDialog{
        id:laptop_assets_add_unsuccessful
        text:"Laptop Id And Name Mandatary\n(or)This Employee Already have Assets "
    }

    Component.onCompleted: {
        console.log("Laptop Assets Page Constructor")
        console.log("Date"+approval_date_txt2.text)
    }
    Component.onDestruction: {
        console.log("Loptop Assets Page Distruction")
    }

}
