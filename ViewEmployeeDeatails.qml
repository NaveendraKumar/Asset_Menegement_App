import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:viewEmployeedeatails
    width:_root.width
    height:_root.height

    Text {
        id: heading
        text: "Employee Deatails"
        color: "#252525"
        font.bold: true
        font.pixelSize: viewEmployeedeatails.width/15
        anchors.top: viewEmployeedeatails.top
        anchors.horizontalCenter: viewEmployeedeatails.horizontalCenter
        anchors.topMargin: viewEmployeedeatails.height/60
        font.family: "Helvetica"
    }

    Rectangle{
        id:view_emp_deatails_rect
        width: viewEmployeedeatails.width/1.1
        height: viewEmployeedeatails.height/2
        anchors.horizontalCenter: viewEmployeedeatails.horizontalCenter
        anchors.top: viewEmployeedeatails.top
        anchors.topMargin: viewEmployeedeatails.height/8
        radius: viewEmployeedeatails.width/30
        gradient: Gradient{
            GradientStop { position: 0.2; color: "#acb6e5" }
            GradientStop { position: 1.0; color: "#86fde8" }
        }
        Item {
            id: profile
            width: view_emp_deatails_rect.width/5
            height: view_emp_deatails_rect.height/5
            anchors.top: view_emp_deatails_rect.top
            anchors.topMargin: view_emp_deatails_rect.height/20
            anchors.horizontalCenter: view_emp_deatails_rect.horizontalCenter
            Image {
                id: profileimg
                source: "ApplicationImages/icons/profile.png"
                anchors.fill: parent
            }
        }

        Text {
            id: emp_id
            text:EmployeeDatabase.empid
            font.bold: true
            font.pixelSize: view_emp_deatails_rect.width/18
            font.family: "Helvetica"
            anchors.top: profile.bottom
            anchors.topMargin: view_emp_deatails_rect.height/5
            anchors.horizontalCenter: view_emp_deatails_rect.horizontalCenter
        }
        Text {
            id: emp_name
            text:EmployeeDatabase.empname
            font.bold: true
            font.pixelSize: view_emp_deatails_rect.width/18
            font.family: "Helvetica"
            anchors.top: emp_id.bottom
            anchors.topMargin: view_emp_deatails_rect.height/15
            anchors.horizontalCenter: emp_id.horizontalCenter
        }
        Text {
            id: emp_email
            text:EmployeeDatabase.empemail
            font.bold: true
            font.pixelSize: view_emp_deatails_rect.width/18
            font.family: "Helvetica"
            anchors.top: emp_name.bottom
            anchors.topMargin: view_emp_deatails_rect.height/15
            anchors.horizontalCenter: emp_name.horizontalCenter
        }
    }
    Button{
        id:back_button
        width: viewEmployeedeatails.width/7
        height: viewEmployeedeatails.height/13
        anchors.top: viewEmployeedeatails.top
        anchors.left: viewEmployeedeatails.left
        background: Rectangle{
            id:back_button_bg_rect
            anchors.fill: parent
            color: "transparent"
            radius: back_button.width/30
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
            console.log("Authority Display Employee Deatails Back Button Clicked")
            _load.source="ViewAllEmployeesList.qml"
            viewEmployeedeatails.visible=false
        }
    }
    Button{
        id:employee_assets
        width: viewEmployeedeatails.width/1.8
        height: viewEmployeedeatails.height/15
        anchors.top: view_emp_deatails_rect.bottom
        anchors.horizontalCenter: view_emp_deatails_rect.horizontalCenter
        anchors.topMargin: viewEmployeedeatails.height/20
        Text {
            id: employee_assets_txt
            text: "Employee Assets"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: viewEmployeedeatails.width/20
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:employee_assets_button_bg_rect
            anchors.fill: parent
            color: "black"
            radius: employee_assets.width/30
        }
        onPressed: {
            employee_assets_button_bg_rect.color="#FAF9F8"
            employee_assets_txt.color="#635AD9"
        }
        onReleased: {
            employee_assets_button_bg_rect.color="black"
            employee_assets_txt.color="#FAF9F8"
        }
        onClicked: {
            console.log("Authority Display Employee Assets  Button Clicked")
            _load.source="AuthorityDisplayEmployeeDeatailsPage.qml"
            viewEmployeedeatails.visible=false
        }
    }
    Button{
        id:remove_emplyee
        width: viewEmployeedeatails.width/1.8
        height: viewEmployeedeatails.height/15
        anchors.top: employee_assets.bottom
        anchors.horizontalCenter: employee_assets.horizontalCenter
        anchors.topMargin: viewEmployeedeatails.height/20
        Text {
            id: remove_emplyee_txt
            text: "Remove Employee"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: viewEmployeedeatails.width/20
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:remove_employee_button_bg_rect
            anchors.fill: parent
            color: "black"
            radius: employee_assets.width/30
        }
        onPressed: {
            remove_employee_button_bg_rect.color="#FAF9F8"
            remove_emplyee_txt.color="#635AD9"
        }
        onReleased: {
            remove_employee_button_bg_rect.color="black"
            remove_emplyee_txt.color="#FAF9F8"
        }
        onClicked: {
            console.log("Delete Employee Assets  Button Clicked")
            EmployeeDatabase.removeEmoployee(EmployeeDatabase.empid,EmployeeDatabase.empname)
            if(EmployeeDatabase.messegePopQml){
                deletesuccess.visible=true
                console.log("Employee Remove Successful")
            }else{
                deletefail.visible=true
                console.log("Employee Remove failed")
            }
        }
    }

    MessageDialog{
        id:deletesuccess
        text: "Employee Delete Success"
    }
    MessageDialog{
        id:deletefail
        text: "Error"
    }
    Component.onCompleted: {
        console.log("  View Employee Deatails Page Constructor")
    }
    Component.onDestruction: {
        console.log("  View Employee Deatails Page Distruction")
    }

}
