import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

//this service page for the authority issue the what are the assets to the employee to note

Item {
    id:auth_service_page
    width: _root.width
    height: _root.height

    Text {
        id: authdeatailstxt
        text: "Authority Deatails"
        font.bold: true
        color: "#252525"
        font.family: "Helvetica"
        font.pixelSize: auth_service_page.width/15
        anchors.top: auth_service_page.top
        anchors.horizontalCenter: auth_service_page.horizontalCenter
        anchors.topMargin: auth_service_page.height/60
    }

    ColumnLayout{
        id:_auth_deatails_column
        spacing: auth_service_page.height/25
        anchors.horizontalCenter: auth_service_page.horizontalCenter
        anchors.top: authdeatailstxt.top
        anchors.topMargin: auth_service_page.height/13
        Text {
            id: authid
            text: "Id :       "+Authoritydatabase.authId
            color: "#6e61ca"
            font.bold: true
            font.family: "Helvetica"
            font.pixelSize: auth_service_page.width/17
        }
        Text {
            id: authname
            text: "Name : "+Authoritydatabase.authName
            color: "#6e61ca"
            font.bold: true
            font.family: "Helvetica"
            font.pixelSize: auth_service_page.width/17
        }

    }

    Row{
        id:admin_button_row
        spacing: auth_service_page.width/12
        anchors.top: _auth_deatails_column.bottom
        anchors.topMargin:auth_service_page.height/25
        anchors.horizontalCenter: auth_service_page.horizontalCenter
        Button{
            id:add_new_employee_person
            width: auth_service_page.width/3
            height: auth_service_page.height/5
            background: Rectangle{
                id:new_emp_button_bg_rect
                anchors.fill: parent
                color: "#6e61ca"
                radius: add_new_employee_person.width/35
                Image {
                    id: new_employee_img
                    width: new_emp_button_bg_rect.width/1.4
                    height: new_emp_button_bg_rect.height/1.6
                    anchors.top: new_emp_button_bg_rect.top
                    anchors.topMargin: new_emp_button_bg_rect.height/30
                    anchors.horizontalCenter: new_emp_button_bg_rect.horizontalCenter
                    source: "ApplicationImages/icons/employee.png"
                }
                Text {
                    id: add_new_employee_txt
                    text:"New Employee"
                    font.bold: true
                    anchors.horizontalCenter: new_emp_button_bg_rect.horizontalCenter
                    anchors.bottom: new_emp_button_bg_rect.bottom
                    anchors.bottomMargin: new_emp_button_bg_rect.height/15
                }
            }
            onPressed: {
                new_emp_button_bg_rect.color="#FAF9F8"

            }
            onReleased: {
                new_emp_button_bg_rect.color="#6e61ca"

            }
            onClicked: {
                console.log("Authority Service page add New Emp button Clicked")
                _load.source="EmployeeRegisterpage.qml"
                auth_service_page.visible=false

            }
        }
        Button{
            id:view_employees
            width: auth_service_page.width/3
            height: auth_service_page.height/5

            background: Rectangle{
                id:view_emp_button_bg_rect
                anchors.fill: parent
                color: "#6e61ca"
                radius: view_employees.width/35
                Image {
                    id: view_all_employees_img
                    width: view_emp_button_bg_rect.width/1.4
                    height: view_emp_button_bg_rect.height/1.6
                    anchors.top: view_emp_button_bg_rect.top
                    anchors.topMargin: view_emp_button_bg_rect.height/30
                    anchors.horizontalCenter: view_emp_button_bg_rect.horizontalCenter
                    source: "ApplicationImages/icons/viewAllemployeeicon.png"
                }
                Text {
                    id: view_all_employees_txt
                    text:"View Employees"
                    font.bold: true
                    anchors.horizontalCenter: view_emp_button_bg_rect.horizontalCenter
                    anchors.bottom: view_emp_button_bg_rect.bottom
                    anchors.bottomMargin: view_emp_button_bg_rect.height/15
                }
            }
            onPressed: {
                view_emp_button_bg_rect.color="#FAF9F8"

            }
            onReleased: {
                view_emp_button_bg_rect.color="#6e61ca"

            }
            onClicked: {
                console.log("Authority Service page add View Employees button Clicked")
                _load.source="ViewAllEmployeesList.qml"
                auth_service_page.visible=false

            }
        }
    }


    Text {
        id: emp_deataols_txt
        text: "Employee Deatails"
        font.bold: true
        color: "#252525"
        font.family: "Helvetica"
        font.pixelSize: auth_service_page.width/15
        anchors.bottom: auth_service_page.bottom
        anchors.bottomMargin:auth_service_page.height/2.1
        anchors.horizontalCenter: auth_service_page.horizontalCenter
    }
    ColumnLayout{
        id:emp_txt_field_col
        spacing:auth_service_page.height/40
        anchors.bottom:auth_service_page.bottom
        anchors.bottomMargin: auth_service_page.height/4
        anchors.horizontalCenter: auth_service_page.horizontalCenter
        TxtField{
            id:empid_txt_field
            textFieldWidth: auth_service_page.width/1.3
            textFieldHeight: auth_service_page.height/15
            textFieldIcon:"ApplicationImages/icons/userid.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Employee id"
            fontSize: empid_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:empname_txt_field
            textFieldWidth: auth_service_page.width/1.3
            textFieldHeight: auth_service_page.height/15
            textFieldIcon:"ApplicationImages/icons/username.png"
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Employee Name"
            fontSize: empname_txt_field.width/15
            fontbold: true
        }

    }

    Button{
        id:backbutton
        width: auth_service_page.width/7
        height: auth_service_page.height/13
        anchors.top: auth_service_page.top
        anchors.left: auth_service_page.left
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
            console.log("Authority Service page Back button Clicked")
            _load.source="AuthorityLoginpage.qml"
            auth_service_page.visible=false
        }
    }
    Button{
        id:submitbutton
        width: auth_service_page.width/1.8
        height: auth_service_page.height/14
        anchors.top: emp_txt_field_col.bottom
        anchors.topMargin: auth_service_page.height/20
        anchors.horizontalCenter: emp_txt_field_col.horizontalCenter
        Text {
            id: submit_button_txt
            text:"Submit"
            color: "#FAF9F8"
            font.bold:true
            font.family: "Helvetica"
            font.pixelSize: auth_service_page.width/20
            anchors.centerIn: parent
        }
        background: Rectangle{
            id:submit_button_bg_rect
            anchors.fill: parent
            color: "black"
            radius: submitbutton.width/30
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
            console.log("Authority Service page Submit button Clicked")
            EmployeeDatabase.authorityVerifyEmployee(empid_txt_field.textt,empname_txt_field.textt);
            if(EmployeeDatabase.messegePopQml){
                console.log("Valid Deatails")
                empdeatailsvalid.visible=true
                _load.source="AuthorityAssetsProvidePage.qml"
                auth_service_page.visible=false
            }
            else{
                console.log("invalid Deaatails")
                empdeatailsnotvalid.visible=true
            }
        }
    }
    MessageDialog{
        id:empdeatailsvalid
        text: "Employee Deatails Successfully Validate"
    }
    MessageDialog{
        id:empdeatailsnotvalid
        text: "Please Enter the Valid Employee Deatails"
    }

    Component.onCompleted: {
        console.log("Authority Service page Constructor")
    }
    Component.onDestruction:{
        console.log("Authority Service Page Distruction")
    }
}
