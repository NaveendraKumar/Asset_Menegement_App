import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

Item {
    id:authority_loginscreen
    width: _root.width
    height:_root.height

    Rectangle{
        id:admin_img_rect
        width: authority_loginscreen.width/3
        height:authority_loginscreen.height/5
        radius: admin_img_rect.height/30
        color: "Transparent"
        Image {
            id: admin_icon
            width: authority_loginscreen.width/4
            height: authority_loginscreen.height/6
            source: "ApplicationImages/icons/Authority.png"
            anchors.top: admin_img_rect.top
            anchors.topMargin: admin_img_rect.height/20
            anchors.horizontalCenter: admin_img_rect.horizontalCenter
        }
        anchors.top: authority_loginscreen.top
        anchors.topMargin: authority_loginscreen.height/20
        anchors.horizontalCenter: authority_loginscreen.horizontalCenter
    }
    Text {
        id: admin_txt
        text:"Authority Login"
        font.bold: true
        font.pixelSize: authority_loginscreen.width/17
        font.family: "Helvetica"
        anchors.top: admin_img_rect.bottom
        anchors.topMargin: admin_img_rect.height/15
        anchors.horizontalCenter: admin_img_rect.horizontalCenter
    }
    Column{
        id:login_deatails_txtfield_layout
        spacing: authority_loginscreen.height/40
        anchors.centerIn: parent
        TxtField{
            id:useridtxtinput
            textFieldWidth: authority_loginscreen.width/1.3
            textFieldHeight: authority_loginscreen.height/15
            textFieldIcon:"ApplicationImages/icons/userid.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User id"
            fontSize: useridtxtinput.width/15
            fontbold: true

        }
        TxtField{
            id:passwordtxtinput
            textFieldWidth: authority_loginscreen.width/1.3
            textFieldHeight: authority_loginscreen.height/15
            textFieldIcon:"ApplicationImages/icons/password.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Password"
            fontSize: passwordtxtinput.width/15
            fontbold: true
        }

    }


    Button{
        id:create_account_button
        width: authority_loginscreen.width/1.5
        height: authority_loginscreen.height/12
        anchors.horizontalCenter: login_deatails_txtfield_layout.horizontalCenter
        anchors.bottom: loginbuttonrect.top
        anchors.bottomMargin:authority_loginscreen.height/20
        background: Rectangle{
            id:signupbgrect
            anchors.fill: parent
            radius: create_account_button.width/20
            color: "transparent"
            Text {
                id: signupbuttontxt
                text: "New user ? Create Account"
                color: "#252525"
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize:signupbgrect.width/15
                font.family: "Helvetica"
            }
        }

        onPressed: {
            signupbuttontxt.color="#746"
        }
        onReleased: {
            signupbuttontxt.color="#252525"
        }
        onClicked: {
            _load.source="AuthorityRegistrationpage.qml"
            authority_loginscreen.visible=false
        }

    }
    Button{
        id:loginbuttonrect
        width: authority_loginscreen.width/1.5
        height: authority_loginscreen.height/12
        anchors.top: login_deatails_txtfield_layout.bottom
        anchors.horizontalCenter: login_deatails_txtfield_layout.horizontalCenter
        anchors.topMargin:authority_loginscreen.height/5
        background: Rectangle{
            id:loginbgrect
            anchors.fill: parent
            radius: loginbuttonrect.width/20
            color: "black"
        }
        Text {
            id: loginbuttontxt
            text: "Login"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize:loginbuttonrect.width/10
            font.family: "Helvetica"
        }
        onPressed: {
            loginbgrect.color="#FAF9F8"
            loginbuttontxt.color="#635AD9"

        }
        onReleased: {
            loginbgrect.color="black"
            loginbuttontxt.color="#FAF9F8"
        }

        onClicked: {
            console.log("Authority Loginpage Login Button Clicked");
            Authoritydatabase.authorityLoginVerify(useridtxtinput.textt,passwordtxtinput.textt)
            if(Authoritydatabase.messegePopQml){
                console.log("Login Successful")
                loginsuccess.visible=true
                _load.source="AuthorityServicepage.qml"
                authority_loginscreen.visible=false
            }
            else{
                console.log("incorrect userid and password")
                loginfail.visible=true
            }
        }

    }

    MessageDialog{
        id:loginsuccess
        text: "Login Success"
    }
    MessageDialog{
        id:loginfail
        text: "incorrect userid or password"
    }
    Component.onCompleted: {
        console.log("Authority Loginpage Construction")
    }
    Component.onDestruction: {
        console.log("Authority LoginPage Distruction")
    }
}
