import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:update_emp_profile
    width: _root.width
    height: _root.height

    Text {
        id: heading
        text: "Update Profile"
        font.bold:true
        font.family: "Helvetica"
        font.pixelSize: update_emp_profile.width/14
        color: "#252525"
        anchors.horizontalCenter: update_emp_profile.horizontalCenter
        anchors.top: update_emp_profile.top
        anchors.topMargin: update_emp_profile.height/30
    }

    Item {
        id: emp_img_item
        width: update_emp_profile.width/3.5
        height: update_emp_profile.height/6
        anchors.top: heading.bottom
        anchors.horizontalCenter: heading.horizontalCenter
        anchors.topMargin: update_emp_profile.height/25
        Image {
            id: profile_img
            source: "ApplicationImages/icons/profile update.png"
            anchors.fill: parent
        }
    }
    ColumnLayout{
        id:emp_deatails_col_layout
        spacing: update_emp_profile.height/50
        anchors.centerIn: parent

        TxtField{
            id:emp_id_txt_field
            textFieldWidth: update_emp_profile.width/1.3
            textFieldHeight: update_emp_profile.height/15
            textFieldIcon:"ApplicationImages/icons/userid.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User id"
            fontSize: emp_id_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:emp_name_txt_field
            textFieldWidth: update_emp_profile.width/1.3
            textFieldHeight: update_emp_profile.height/15
            textFieldIcon:"ApplicationImages/icons/username.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User Name"
            fontSize: emp_name_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:emp_email_txt_field
            textFieldWidth: update_emp_profile.width/1.3
            textFieldHeight: update_emp_profile.height/15
            textFieldIcon:"ApplicationImages/icons/email.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "User Email"
            fontSize: emp_email_txt_field.width/15
            fontbold: true

        }

    }
    Button{
        id:back_button
        width: update_emp_profile.width/7
        height: update_emp_profile.height/13
        anchors.top: update_emp_profile.top
        anchors.topMargin: update_emp_profile.height/70
        anchors.left: update_emp_profile.left
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
            back_button_rect.color="transparent"
        }
        onClicked: {
            console.log("Update Profile page Back button Clicked")
            _load.source="UpdateAssetsDeatails.qml"
            update_emp_profile.visible=false
        }
    }
    Button{
        id:submitbutton
        width: update_emp_profile.width/1.8
        height: update_emp_profile.height/13
        anchors.top: emp_deatails_col_layout.bottom
        anchors.horizontalCenter: emp_deatails_col_layout.horizontalCenter
        anchors.topMargin: update_emp_profile.height/6
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
            console.log("Update Profile page Submit button Clicked")
            EmployeeDatabase.updateEmployeeDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,emp_id_txt_field.textt,emp_name_txt_field.textt,emp_email_txt_field.textt);
            if(EmployeeDatabase.messegePopQml){
                updatesuccess.visible=true
                console.log("Employee Profile Updated")
                _load.source="AuthorityServicepage.qml"
                update_emp_profile.visible=false
            }else{
                updatefail.visible=true
                console.log("Employee Deatails Mandotary")
            }
        }
    }

    MessageDialog{
        id:updatesuccess
        text:"Employee Deatails Updated"
    }
    MessageDialog{
        id:updatefail
        text:"Employee Deatails Mandotary"
    }
    Component.onCompleted: {
        console.log("Update Profile Deatails Page Construction")
    }
    Component.onDestruction: {
        console.log("Update Profile Deatails Page Distruction")
    }
}
