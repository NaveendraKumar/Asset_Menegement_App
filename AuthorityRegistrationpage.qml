import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.5

Item {
    id:authority_register_page
    width: _root.width
    height: _root.height

    Rectangle{
        id:admin_img_rect
        width: authority_register_page.width/3
        height:authority_register_page.height/5
        radius: admin_img_rect.height/30
        color: "Transparent"
        Image {
            id: admin_icon
            width: authority_register_page.width/4
            height: authority_register_page.height/6
            source: "ApplicationImages/icons/Authority.png"
            anchors.top: admin_img_rect.top
            anchors.topMargin: admin_img_rect.height/20
            anchors.horizontalCenter: admin_img_rect.horizontalCenter
        }
        anchors.top: authority_register_page.top
        anchors.topMargin: authority_register_page.height/20
        anchors.horizontalCenter: authority_register_page.horizontalCenter
    }
    Text {
        id: admin_txt
        text:"Add New Admin"
        font.bold: true
        font.pixelSize: authority_register_page.width/17
        font.family: "Helvetica"
        anchors.top: admin_img_rect.bottom
        anchors.topMargin: admin_img_rect.height/15
        anchors.horizontalCenter: admin_img_rect.horizontalCenter
    }

    ColumnLayout{
        id:regtxtfieldcol
        spacing:authority_register_page.height/40
        anchors.centerIn: parent
        TxtField{
            id:fullnameinput
            textFieldWidth: authority_register_page.width/1.3
            textFieldHeight: authority_register_page.height/15
            textFieldIcon:"ApplicationImages/icons/username.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User Name"
            fontSize: fullnameinput.width/15
            fontbold: true

        }
        TxtField{
            id:user_id_input
            textFieldWidth: authority_register_page.width/1.3
            textFieldHeight: authority_register_page.height/15
            textFieldIcon:"ApplicationImages/icons/userid.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User id"
            fontSize: user_id_input.width/15
            fontbold: true

        }
        TxtField{
            id:passwduserinput
            textFieldWidth: authority_register_page.width/1.3
            textFieldHeight: authority_register_page.height/15
            textFieldIcon:"ApplicationImages/icons/password.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Password"
            fontSize: passwduserinput.width/15
            fontbold: true
        }
    }


    Button{
        id:backbutton
        width: authority_register_page.width/7
        height: authority_register_page.height/13
        anchors.top: authority_register_page.top
        anchors.topMargin: authority_register_page.height/30
        anchors.left: authority_register_page.left
        background: Rectangle{
            id:back_button_bg_rect
            anchors.fill: parent
            radius: back_button_bg_rect.width/20
            color: "transparent"
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
            console.log("Authority Registerpage back Button Clicked")
            _load.source="AuthorityLoginpage.qml"
            authority_register_page.visible=false
        }
    }

    Button{
        id:create_account_button
        width: authority_register_page.width/1.8
        height: authority_register_page.height/14
        anchors.top: regtxtfieldcol.bottom
        anchors.horizontalCenter: regtxtfieldcol.horizontalCenter
        anchors.topMargin: authority_register_page.height/8

        Text {
            id: submitbuttontxt
            text: "New Admin"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: create_account_button.width/10
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:button_bg_rect
            anchors.fill: parent
            radius: button_bg_rect.width/20
            color: "black"
        }
        onPressed: {
            submitbuttontxt.color="#635AD9"
            button_bg_rect.color="#FAF9F8"
        }
        onReleased: {
            submitbuttontxt.color="#FAF9F8"
            button_bg_rect.color="black"
        }
        onClicked: {

            console.log("Authority Registerpage New Admin Button Clicked")
            Authoritydatabase.insertAuthorityEmployee(fullnameinput.textt,user_id_input.textt,passwduserinput.textt);
            if(Authoritydatabase.messegePopQml){
                console.log("Authority Deatails Successfully Inserted")
                _load.source="AuthorityLoginpage.qml"
                regisretsuccess.visible=true
                authority_register_page.visible=false
            }
            else{
                regisrfail.visible=true
                console.log("invalid Deatails Enterd")
                console.log("Passwors and Confirmpassword MisMatch")
            }

        }
    }
    MessageDialog{
        id:regisretsuccess
        text: "Successfully Added"

    }
    MessageDialog{
        id:regisrfail
        text: "Invalid Deatails Enterd"
    }

    Component.onCompleted: {
        console.log("Authority Registration Construction")
    }
    Component.onDestruction: {
        console.log("Authority Redistration Distruction")
    }

}

