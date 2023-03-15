import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:emp_deatails_display
    width: _root.width
    height: _root.height
    Text {
        id: heading
        text: "Assets Deatails"
        color: "#252525"
        font.bold: true
        font.pixelSize: emp_deatails_display.width/15
        anchors.top: emp_deatails_display.top
        anchors.horizontalCenter: emp_deatails_display.horizontalCenter
        anchors.topMargin: emp_deatails_display.height/60
        font.family: "Helvetica"
    }

    Rectangle{
        id:emp_deatails_rect
        width:emp_deatails_display.width/1.1
        height: emp_deatails_display.height/1.26
        radius: emp_deatails_display.width/30
        anchors.top:heading.bottom
        anchors.topMargin: emp_deatails_display.height/55
        anchors.horizontalCenter: emp_deatails_display.horizontalCenter
        gradient: Gradient{
            GradientStop { position: 0.2; color: "#acb6e5" }
            GradientStop { position: 1.0; color: "#86fde8" }
        }
        ColumnLayout{
            id:assetdeatails
            spacing: emp_deatails_rect.height/50
            anchors.top: emp_deatails_rect.top
            anchors.horizontalCenter: emp_deatails_rect.horizontalCenter
            anchors.topMargin: emp_deatails_rect.height/20
            Text {
                id: laptop_id
                text:"Laptop Id        : "+EmployeeDatabase.laptopid
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: laptop_name
                text:"Laptop Name  : "+EmployeeDatabase.laptopname
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: laptop_approval_date
                text:"Approval Date: "+EmployeeDatabase.lapappdate
                color: "red"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: laptop_due_date
                text:"Due Date          : "+EmployeeDatabase.lapduedate
                color: "red"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id:bag_id
                text:"Bag Id              : "+EmployeeDatabase.bagid
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: bag_name
                text:"Bag Name        : "+EmployeeDatabase.bagname
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: item1
                text:"Item 1              : "+EmployeeDatabase.item1
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: item2
                text:"Item 2              : "+EmployeeDatabase.item2
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: item3
                text:"Item 3              : "+EmployeeDatabase.item3
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: book1
                text:"Book 1              : "+EmployeeDatabase.book1
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: book2
                text:"Book 2              : "+EmployeeDatabase.book2
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: book3
                text:"Book 3              : "+EmployeeDatabase.book3
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }

            Text {
                id: lap_damge
                text:"L/T Damage    : "+EmployeeDatabase.lapdamage
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }
            Text {
                id: bag_damag
                text:"Bag Damage    : "+EmployeeDatabase.bagdamage
                color: "#191641"
                font.bold: true
                font.pixelSize: emp_deatails_rect.width/20
                font.family: "Helvetica"
            }

        }
    }


    Button{
        id:back_button
        width: emp_deatails_display.width/7
        height: emp_deatails_display.height/13
        anchors.top: emp_deatails_display.top
        anchors.left: emp_deatails_display.left
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
            emp_deatails_display.visible=false

        }
    }
    Button{
        id:update_assets
        width: emp_deatails_display.width/1.8
        height: emp_deatails_display.height/15
        anchors.top: emp_deatails_rect.bottom
        anchors.horizontalCenter: emp_deatails_rect.horizontalCenter
        anchors.topMargin: emp_deatails_rect.height/30
        Text {
            id: update_assets_txt
            text: "Update Assets"
            color: "#FAF9F8"
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: emp_deatails_display.width/20
            font.family: "Helvetica"
        }
        background: Rectangle{
            id:update_assets_button_bg_rect
            anchors.fill: parent
            color: "black"
            radius: update_assets.width/30
        }
        onPressed: {
            update_assets_button_bg_rect.color="#FAF9F8"
            update_assets_txt.color="#635AD9"
        }
        onReleased: {
            update_assets_button_bg_rect.color="black"
            update_assets_txt.color="#FAF9F8"
        }
        onClicked: {
            console.log("Authority Display Employee Deatails Edit Button Clicked")
            _load.source="UpdateAssetsDeatails.qml"
            emp_deatails_display.visible=false
        }
    }
    Component.onCompleted: {
        console.log("Authority Display Employee Deatails Page Constructor")
    }
    Component.onDestruction: {
        console.log("Authority Display Employee Deatails Page Distruction")
    }

}
