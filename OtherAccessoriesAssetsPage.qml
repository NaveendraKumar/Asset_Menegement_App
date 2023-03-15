import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:otherassets
    width: _root.width
    height: _root.height
    Text {
        id: heading
        text: "Other Assets Deatails"
        font.bold: true
        font.pixelSize: otherassets.width/16
        font.family: "Helvetica"
        color: "#252525"
        anchors.top: otherassets.top
        anchors.topMargin: otherassets.height/30
        anchors.horizontalCenter: otherassets.horizontalCenter
    }
    Item {
        id: asseticon
        width: otherassets.width/3.6
        height: otherassets.height/6.5
        anchors.top: heading.bottom
        anchors.topMargin: heading.height/2
        anchors.horizontalCenter: heading.horizontalCenter
        Image {
            id: assetimg
            source: "ApplicationImages/icons/otherassetsicon.png"
            anchors.fill: parent

        }
    }

    ColumnLayout{
        id:other_assets_deatails_col_layout
        spacing: otherassets.height/70
       anchors.centerIn: parent
        TxtField{
            id:item1_txt_field
            textFieldWidth: otherassets.width/1.3
            textFieldHeight: otherassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "item 1"
            fontSize: item1_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item2_txt_field
            textFieldWidth: otherassets.width/1.3
            textFieldHeight: otherassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "item 2"
            fontSize: item2_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item3_txt_field
            textFieldWidth: otherassets.width/1.3
            textFieldHeight: otherassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "item 3"
            fontSize: item3_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item4_txt_field
            textFieldWidth: otherassets.width/1.3
            textFieldHeight: otherassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "item 4"
            fontSize: item4_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item5_txt_field
            textFieldWidth: otherassets.width/1.3
            textFieldHeight: otherassets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "item 5"
            fontSize: item5_txt_field.width/15
            fontbold: true

        }

    }
    Button{
        id:submit_button
        width: otherassets.width/1.8
        height: otherassets.height/13
        anchors.top: other_assets_deatails_col_layout.bottom
        anchors.topMargin: otherassets.height/10
        anchors.horizontalCenter: other_assets_deatails_col_layout.horizontalCenter
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
            console.log("Other Accessories Assets Submit  Button Clicked")
            AssetsDatabase.otherAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,item1_txt_field.textt,item2_txt_field.textt,item3_txt_field.textt,item4_txt_field.textt,item5_txt_field.textt);
            if(AssetsDatabase.messegePopQml){
                console.log("Other Assets Successfully Added")
                other_assets_add_successful.visible=true
            }
            else{
                other_assets_add_unsuccessful.visible=true
                console.log("Assets Deatails Invalid")
            }
        }
    }
    Button{
        id:backbutton
        width: otherassets.width/7
        height: otherassets.height/13
        anchors.top: otherassets.top
        anchors.topMargin: otherassets.height/70
        anchors.left: otherassets.left

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
            back_button_bg_rect.color="black"

        }
        onClicked: {
            console.log("Authority Assets Provide Page Back Button Clicked")
            _load.source="AuthorityAssetsProvidePage.qml"
            otherassets.visible=false
        }
    }
    MessageDialog{
        id:other_assets_add_successful
        text: "Assets Successfully Added"
    }
    MessageDialog{
        id:other_assets_add_unsuccessful
        text:"Details Mandatory (none)\n(or)This Employee Already have Assets"
    }
    Component.onCompleted: {
        console.log("Other Assets Page Constructor")
    }
    Component.onDestruction: {
        console.log("Other Assets Page Distruction")
    }

}
