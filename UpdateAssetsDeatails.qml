import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id:update_assets_deatails
    width: _root.width
    height: _root.height
    Text {
        id: heading
        text: "Update Deatails"
        font.bold:true
        font.pixelSize: update_assets_deatails.width/15
        font.family: "Helvetica"
        anchors.top: update_assets_deatails.top
        anchors.topMargin: update_assets_deatails.height/30
        anchors.horizontalCenter: update_assets_deatails.horizontalCenter
    }
    Rectangle{
        id:admin_img_rect
        width: update_assets_deatails.width/3
        height:update_assets_deatails.height/5
        radius: admin_img_rect.height/30
        color: "Transparent"
        Image {
            id: admin_icon
            width: update_assets_deatails.width/4
            height: update_assets_deatails.height/6
            source: "ApplicationImages/icons/Authority.png"
            anchors.top: admin_img_rect.top
            anchors.topMargin: admin_img_rect.height/20
            anchors.horizontalCenter: admin_img_rect.horizontalCenter
        }
        anchors.top: update_assets_deatails.top
        anchors.topMargin: update_assets_deatails.height/10
        anchors.horizontalCenter: update_assets_deatails.horizontalCenter
    }
    Rectangle{
        id:emp_operation_rect
        width: update_assets_deatails.width
        height: update_assets_deatails.height/1.4
        radius: 20
        anchors.bottom: parent.bottom
        color: "#ffffff"
        Column{
            id:assets_column
            anchors.fill: emp_operation_rect
            spacing: update_assets_deatails.height/30
            anchors.top: emp_operation_rect.top
            anchors.topMargin: emp_operation_rect.height/20
            anchors.horizontalCenter: emp_operation_rect.horizontalCenter
            Row{
                id:assets_row_1
                spacing: update_assets_deatails.width/10
                anchors.horizontalCenter: assets_column.horizontalCenter

                Button{
                    id:laptopbutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:laptopbg_rect
                        anchors.fill: parent
                        radius: laptopbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: laptopimg
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: laptopbg_rect.height/20
                            anchors.horizontalCenter: laptopbg_rect.horizontalCenter
                            source: "ApplicationImages/icons/lapicon.png"
                        }
                        Text {
                            id: laptoptxt
                            text:"Laptop"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: laptopbutton.width/6
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: laptopbg_rect.horizontalCenter
                            anchors.bottomMargin: laptopbg_rect.height/20
                        }
                    }
                    onPressed: {
                        laptopbg_rect.color="#FAF9F8"
                        laptoptxt.color="#ff6d00"
                    }
                    onReleased: {
                        laptopbg_rect.color="#635AD9"
                        laptoptxt.color="#252525"
                    }
                    onClicked: {
                        console.log("Laptop Button Clicked")
                        _load.source="UpdateLaptopAssetDeatails.qml"
                        update_assets_deatails.visible=false

                    }
                }
                Button{
                    id:bagbutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:bagbg_rect
                        anchors.fill: parent
                        radius: bagbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: bagimg
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: bagbg_rect.height/20
                            anchors.horizontalCenter: bagbg_rect.horizontalCenter
                            source: "ApplicationImages/icons/bag.png"
                        }
                        Text {
                            id: bagtxt
                            text:"Bag"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: bagbutton.width/6
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: bagbg_rect.horizontalCenter
                            anchors.bottomMargin: bagbg_rect.height/20
                        }
                    }
                    onPressed: {
                        bagbg_rect.color="#FAF9F8"
                        bagtxt.color="#ff6d00"
                    }
                    onReleased: {
                        bagbg_rect.color="#635AD9"
                        bagtxt.color="#252525"
                    }
                    onClicked: {
                        console.log("Bag Button Clicked")
                        _load.source="UpdateBagAssetDeatails.qml"
                        update_assets_deatails.visible=false
                    }
                }
            }
            Row{
                id:assets_row_2
                spacing: update_assets_deatails.width/10
                anchors.horizontalCenter: assets_column.horizontalCenter

                Button{
                    id:bookbutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:books_bg_rect
                        anchors.fill: parent
                        radius: bookbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: bookimg
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: books_bg_rect.height/20
                            anchors.horizontalCenter: books_bg_rect.horizontalCenter
                            source: "ApplicationImages/icons/books.png"
                        }
                        Text {
                            id: booktxt
                            text:"Book"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: bookbutton.width/6
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: books_bg_rect.horizontalCenter
                            anchors.bottomMargin: books_bg_rect.height/20
                        }
                    }
                    onPressed: {
                        books_bg_rect.color="#FAF9F8"
                        booktxt.color="#ff6d00"
                    }
                    onReleased: {
                        books_bg_rect.color="#635AD9"
                        booktxt.color="#252525"
                    }
                    onClicked: {
                        console.log("Book Button Clicked")
                        _load.source="UpdateBookAssetsPage.qml"
                        update_assets_deatails.visible=false

                    }
                }
                Button{
                    id:otherbutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:other_assets_bg_rect
                        anchors.fill: parent
                        radius: bookbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: other
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: other_assets_bg_rect.height/20
                            anchors.horizontalCenter: other_assets_bg_rect.horizontalCenter
                            source: "ApplicationImages/icons/otherassetsicon.png"
                        }
                        Text {
                            id: other_txt
                            text:"Other Assets"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: otherbutton.width/6
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: other_assets_bg_rect.horizontalCenter
                            anchors.bottomMargin: other_assets_bg_rect.height/20
                        }
                    }
                    onPressed: {
                        other_assets_bg_rect.color="#FAF9F8"
                        other_txt.color="#ff6d00"
                    }
                    onReleased: {
                        other_assets_bg_rect.color="#635AD9"
                        other_txt.color="#252525"
                    }
                    onClicked: {
                        console.log("Others Button Clicked")
                        _load.source="UpdateOtherAssetDeatails.qml"
                        update_assets_deatails.visible=false

                    }
                }
            }
            Row{
                id:assets_row_3
                spacing: update_assets_deatails.width/10
                anchors.horizontalCenter: assets_column.horizontalCenter
                Button{
                    id:assetsimgbutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:assets_imgs_bg_rect
                        anchors.fill: parent
                        radius: bookbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: assets_img
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: assets_imgs_bg_rect.height/20
                            anchors.horizontalCenter: assets_imgs_bg_rect.horizontalCenter
                            source: "ApplicationImages/icons/gallery.png"
                        }
                        Text {
                            id: assets_img_txt
                            text:"Assets images"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: otherbutton.width/7
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: assets_imgs_bg_rect.horizontalCenter
                            anchors.bottomMargin: assets_imgs_bg_rect.height/20
                        }
                    }
                    onPressed: {
                        assets_imgs_bg_rect.color="#FAF9F8"
                        assets_img_txt.color="#ff6d00"
                    }
                    onReleased: {
                        assets_imgs_bg_rect.color="#635AD9"
                        assets_img_txt.color="#252525"
                    }
                    onClicked: {
                        console.log("Upload Image Button Clicked")
                        //                        _load.source="OtherAccessoriesAssetsPage.qml"
                        //                        update_assets_deatails.visible=false

                    }
                }

                Button{
                    id:update_emp_deatails
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:update_emp_bg_rect
                        anchors.fill: parent
                        radius: update_emp_deatails.width/30
                        color: "#635AD9"
                        Image {
                            id: update_emp_deatails_img
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: update_emp_bg_rect.height/20
                            anchors.horizontalCenter: update_emp_bg_rect.horizontalCenter
                            source: "ApplicationImages/icons/employee.png"
                        }
                        Text {
                            id: update_emp_txt
                            text:"Employee"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: otherbutton.width/6
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: update_emp_bg_rect.horizontalCenter
                            anchors.bottomMargin: update_emp_bg_rect.height/20
                        }
                    }
                    onPressed: {
                        update_emp_bg_rect.color="#FAF9F8"
                        update_emp_txt.color="#ff6d00"
                    }
                    onReleased: {
                        update_emp_bg_rect.color="#635AD9"
                        update_emp_txt.color="#252525"
                    }
                    onClicked: {
                        console.log("Update Employee Deatails Button Clicked")
                        _load.source="UpdateEmployeeProfile.qml"
                        update_assets_deatails.visible=false

                    }
                }
            }
        }
    }

    Button{
        id:back_button
        width: update_assets_deatails.width/7
        height: update_assets_deatails.height/13
        anchors.top: update_assets_deatails.top
        anchors.left: update_assets_deatails.left
        anchors.topMargin: update_assets_deatails.height/60
        anchors.leftMargin: update_assets_deatails.width/60
        background: Rectangle{
            id:back_button_rect
            anchors.fill: parent
            radius: back_button.width/20
            color: "transparent"
            Image {
                id: back_button_image
                anchors.fill: parent
                source: "ApplicationImages/icons/previous.png"
            }
        }
        onPressed: {
            back_button_rect.color="#FAF9F8"
        }
        onReleased: {
            back_button_rect.color="black"
        }
        onClicked: {
            console.log("Update Asset page Back button Clicked")
            _load.source="AuthorityDisplayEmployeeDeatailsPage.qml"
            update_assets_deatails.visible=false
        }
    }
    Component.onCompleted: {
        console.log("Update Assetts Deatails Page Construction")
    }
    Component.onDestruction: {
        console.log("Update Assets Deatails Page Distruction")
    }
}































