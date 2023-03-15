import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.5

Item {
    id:registerscreen
    width: _root.width
    height: _root.height

    Rectangle{
        id:emp_img_rect
        width: registerscreen.width/3
        height: registerscreen.height/5
        radius: emp_img_rect.height/30
        color: "transparent"
        Image {
            id: employee_img
            width: registerscreen.width/4
            height: registerscreen.height/7
            source: "ApplicationImages/icons/employee.png"
            anchors.top: emp_img_rect.top
            anchors.topMargin: emp_img_rect.height/30
            anchors.horizontalCenter: emp_img_rect.horizontalCenter
        }
        anchors.top: registerscreen.top
        anchors.topMargin: registerscreen.height/60
        anchors.horizontalCenter: registerscreen.horizontalCenter
    }
    Text {
        id: employee_txt
        text:"Add New Employee"
        font.bold: true
        font.pixelSize: registerscreen.width/19
        font.family: "Helvetica"
        anchors.top: emp_img_rect.bottom
        anchors.horizontalCenter: emp_img_rect.horizontalCenter

    }


    ColumnLayout{
        id:regtxtfieldcol
        spacing:registerscreen.height/50
        anchors.top: registerscreen.top
        anchors.topMargin: registerscreen.height/3.5
        anchors.horizontalCenter: registerscreen.horizontalCenter
        TxtField{
            id:fullnameinput
            textFieldWidth: registerscreen.width/1.3
            textFieldHeight: registerscreen.height/15
            textFieldIcon:"ApplicationImages/icons/username.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User Name"
            fontSize: fullnameinput.width/15
            fontbold: true

        }
        TxtField{
            id:userinput
            textFieldWidth: registerscreen.width/1.3
            textFieldHeight: registerscreen.height/15
            textFieldIcon:"ApplicationImages/icons/userid.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User id"
            fontSize: userinput.width/15
            fontbold: true

        }
        TxtField{
            id:emailuserinput
            textFieldWidth: registerscreen.width/1.3
            textFieldHeight: registerscreen.height/15
            textFieldIcon:"ApplicationImages/icons/email.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "E-mail"
            fontSize: emailuserinput.width/15
            fontbold: true

        }
        TxtField{
            id:passwduserinput
            textFieldWidth: registerscreen.width/1.3
            textFieldHeight: registerscreen.height/15
            textFieldIcon:"ApplicationImages/icons/password.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Password"
            fontSize: passwduserinput.width/15
            fontbold: true

        }
        TxtField{
            id:confirmpasswduserinput
            textFieldWidth: registerscreen.width/1.3
            textFieldHeight: registerscreen.height/15
            textFieldIcon:"ApplicationImages/icons/confirmpassword.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "ConfirmPassword"
            fontSize: confirmpasswduserinput.width/15
            fontbold: true

        }

    }

    Button{
        id:back_button
        width: registerscreen.width/7
        height: registerscreen.height/13
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin:registerscreen.height/60
        background: Rectangle{
            id:back_button_bg_rect
            anchors.fill: parent
            radius: button_bg_rect.width/30
            color: "transparent"
            Image {
                id: backbutton_img
                source: "ApplicationImages/icons/previous.png"
                anchors.fill: parent
            }
        }
        onPressed: {
            back_button_bg_rect.color="#635AD9"
        }
        onReleased: {
            back_button_bg_rect.color="transparent"
        }
        onClicked: {

            console.log("Registerpage back Button Clicked")
            _load.source="AuthorityServicepage.qml"
        }
    }


    Button{
        id:create_account_button
        width: registerscreen.width/2
        height: registerscreen.height/13
        anchors.bottom: registerscreen.bottom
        anchors.bottomMargin: registerscreen.height/6
        anchors.horizontalCenter: registerscreen.horizontalCenter
        Text {
            id: submitbuttontxt
            text: "New Employee"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: create_account_button.width/9
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:button_bg_rect
            anchors.fill: parent
            radius: button_bg_rect.width/30
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

            console.log("Registerpage Submit Button Clicked")
            EmployeeDatabase.storeEmployeeDeatails(fullnameinput.textt,userinput.textt,emailuserinput.textt,passwduserinput.textt,confirmpasswduserinput.textt);
            if(EmployeeDatabase.messegePopQml){
                console.log("Employee Deatails Successfully Inserted")
                _load.source="AuthorityServicepage.qml"
                regisretsuccess.visible=true
                registerscreen.visible=false
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
        text: "Successfully Registered"

    }
    MessageDialog{
        id:regisrfail
        text: "Password and Confirm Password MisMatch\n (or) Invalid Deatails Enterd"
    }

    Component.onCompleted: {
        console.log("Registerpage Construction")
    }
    Component.onDestruction: {
        console.log("Registerpage Distruction")
    }

}


