import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id:view_all_employees_list_view
    width: _root.width
    height: _root.height

    //    property var dataModelMgr
    Text {
        id: authdeatailstxt
        text: "Employees Deatails"
        font.bold: true
        color: "#252525"
        font.family: "Helvetica"
        font.pixelSize: view_all_employees_list_view.width/15
        anchors.top: view_all_employees_list_view.top
        anchors.horizontalCenter: view_all_employees_list_view.horizontalCenter
        anchors.topMargin: view_all_employees_list_view.height/60
    }
    Rectangle{
        id:nameofList
        width: view_all_employees_list_view.width
        height: view_all_employees_list_view.height/18
        anchors.bottom:emplist.top
        anchors.bottomMargin: view_all_employees_list_view.height/25
        color: "transparent"
        Text {
            id: id_txt
            text:"Id"
            font.bold: true
            font.pixelSize: view_all_employees_list_view.height/28
            font.family: "Times New Roman"
            anchors.verticalCenter:  nameofList.verticalCenter
            anchors.left:nameofList.left
            anchors.leftMargin: view_all_employees_list_view.width/10
        }
        Text {
            id: name_txt
            text:"Name"
            font.bold: true
            font.pixelSize: view_all_employees_list_view.height/28
            font.family: "Times New Roman"
            anchors.verticalCenter:  nameofList.verticalCenter
            anchors.left:id_txt.left
            anchors.leftMargin: view_all_employees_list_view.width/1.8
        }

    }
    ListView{
        id:emplist
        height: view_all_employees_list_view.height/1.4
        width: view_all_employees_list_view.width
        spacing: view_all_employees_list_view.height/60
        anchors.bottom: view_all_employees_list_view.bottom
        anchors.bottomMargin: view_all_employees_list_view.height/40
        model: dataModelMgr.empmodel
        delegate: Rectangle{
            id:listrect
            height: view_all_employees_list_view.height/18
            width: view_all_employees_list_view.width
            color: "grey"
            radius: view_all_employees_list_view.width/70

            Text {
                id: id
                text:EMPID
                font.bold: true
                font.pixelSize: view_all_employees_list_view.height/30
                font.family: "Times New Roman"
                anchors.verticalCenter:  listrect.verticalCenter
                anchors.left:listrect.left
                anchors.leftMargin: view_all_employees_list_view.width/25


            }
            Text {
                id: name
                text:EMPNAME
                font.bold: true
                font.pixelSize: view_all_employees_list_view.height/30
                font.family: "Times New Roman"
                anchors.verticalCenter:  listrect.verticalCenter
                anchors.left:id.left
                anchors.leftMargin: view_all_employees_list_view.width/2.2


            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    listrect.color="#ffffff"
                }
                onReleased: {
                    listrect.color="grey"
                }
                onClicked: {
                    console.log("Listview data clicked")
                    console.log("Employee id :"+id.text)
                    console.log("Employee Name :"+name.text)
                    EmployeeDatabase.authorityVerifyEmployee(id.text,name.text);
                    if(EmployeeDatabase.messegePopQml){
                        console.log("Valid Deatails")
//                        empdeatailsvalid.visible=true
                        _load.source="ViewEmployeeDeatails.qml"
//                        _load.source="AuthorityDisplayEmployeeDeatailsPage.qml"
                        view_all_employees_list_view.visible=false
                    }
                    else{
                        console.log("invalid Deaatails")
//                        empdeatailsnotvalid.visible=true
                    }
                }
            }


        }
    }


    Button{
        id:backbutton
        width: view_all_employees_list_view.width/7
        height: view_all_employees_list_view.height/13
        anchors.top: view_all_employees_list_view.top
        anchors.left: view_all_employees_list_view.left
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
            console.log("View All Employees  page Back button Clicked")
            _load.source="AuthorityServicepage.qml"
            view_all_employees_list_view.visible=false
        }
    }
    Component.onCompleted: {
        console.log("View All Employee page Constructed")
    }
    Component.onDestruction: {
        console.log("View All Employee Page Distruction")
    }

}
