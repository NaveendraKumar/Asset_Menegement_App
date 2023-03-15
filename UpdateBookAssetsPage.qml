import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:update_books_assets
    width: _root.width
    height: _root.height

    Text {
        id: heading
        text: "Update Books Deatails"
        font.bold:true
        font.family: "Helvetica"
        font.pixelSize: update_books_assets.width/16
        color: "#252525"
        anchors.horizontalCenter: update_books_assets.horizontalCenter
        anchors.top: update_books_assets.top
        anchors.topMargin: update_books_assets.height/30
    }

    Item {
        id: otherassets_img_item
        width: update_books_assets.width/4
        height: update_books_assets.height/6
        anchors.top: heading.bottom
        anchors.horizontalCenter: heading.horizontalCenter
        anchors.topMargin: update_books_assets.height/45
        Image {
            id: otherassets_img
            source: "ApplicationImages/icons/books.png"
            anchors.fill: parent
        }
    }
    ColumnLayout{
        id:otherassets_deatails_col_layout
        spacing: update_books_assets.height/70
        anchors.bottom: update_books_assets.bottom
        anchors.horizontalCenter: update_books_assets.horizontalCenter
        anchors.bottomMargin: update_books_assets.height/4
        TxtField{
            id:item1_txt_field
            textFieldWidth: update_books_assets.width/1.3
            textFieldHeight: update_books_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Book 1"
            fontSize: item1_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item2_txt_field
            textFieldWidth: update_books_assets.width/1.3
            textFieldHeight: update_books_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Book 2"
            fontSize: item2_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item3_txt_field
            textFieldWidth: update_books_assets.width/1.3
            textFieldHeight: update_books_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Book 3"
            fontSize: item3_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item4_txt_field
            textFieldWidth: update_books_assets.width/1.3
            textFieldHeight: update_books_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Book 4"
            fontSize: item4_txt_field.width/15
            fontbold: true

        }
        TxtField{
            id:item5_txt_field
            textFieldWidth: update_books_assets.width/1.3
            textFieldHeight: update_books_assets.height/15
            backgroundColor: "transparent"
            lineColor: "#000"
            bordercolor: "transparent"
            placeholdertext1: "Book 5"
            fontSize: item5_txt_field.width/15
            fontbold: true

        }

    }

    Button{
        id:back_button
        width: update_books_assets.width/7
        height: update_books_assets.height/13
        anchors.top: update_books_assets.top
        anchors.topMargin: update_books_assets.height/70
        anchors.left: update_books_assets.left
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
            console.log("Update Other Asset page Back button Clicked")
            _load.source="UpdateAssetsDeatails.qml"
            update_books_assets.visible=false
        }
    }
    Button{
        id:submitbutton
        width: update_books_assets.width/1.8
        height: update_books_assets.height/13
        anchors.top: otherassets_deatails_col_layout.bottom
        anchors.horizontalCenter: otherassets_deatails_col_layout.horizontalCenter
        anchors.topMargin: update_books_assets.height/20
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
            console.log("Update Books Asset page Submit button Clicked")
            AssetsDatabase.updateBooksAssetsDeatails(EmployeeDatabase.empid,EmployeeDatabase.empname,item1_txt_field.textt,item2_txt_field.textt,item3_txt_field.textt,item4_txt_field.textt,item5_txt_field.textt);
            if(AssetsDatabase.messegePopQml){
                updatesuccess.visible=true
                console.log("Books Assets Update Success")
                _load.source="AuthorityServicepage.qml"
            }
            else{
                console.log("Employee Does't have any Assets")
                updatefail.visible=true
            }
        }
    }

    MessageDialog{
        id:updatesuccess
        text:"Books Update Success"
    }
    MessageDialog{
        id:updatefail
        text:"fields are Mandatory or \nCurrent Employee Does't have Any Assets"
    }
    Component.onCompleted: {
        console.log("Update Books Assetts Deatails Page Construction")
    }
    Component.onDestruction: {
        console.log("Update Books Assets Deatails Page Distruction")
    }
}
