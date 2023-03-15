import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Item {
    id:authority_assets_provide_page
    width: _root.width
    height: _root.height

    Text {
        id: heading
        text: "Assets Declaration"
        font.bold: true
        font.pixelSize: authority_assets_provide_page.width/14
        font.family: "Helvetica"
        color: "#000"
        anchors.top: authority_assets_provide_page.top
        anchors.topMargin: authority_assets_provide_page.height/50
        anchors.horizontalCenter: authority_assets_provide_page.horizontalCenter
    }
    Item{
        id:emp_deatails_display_rect
        width: authority_assets_provide_page.width/1.08
        height: authority_assets_provide_page.height/5.6
        anchors.top: heading.bottom
        anchors.horizontalCenter: heading.horizontalCenter
        anchors.topMargin: authority_assets_provide_page.height/35

        Text {
            id: emp_id
            text: "Employee id       :  "+EmployeeDatabase.empid
            color: "#191641"
            font.bold: true
            font.pixelSize: emp_deatails_display_rect.width/20
            font.family: "Helvetica"
            anchors.top: parent.top
            anchors.topMargin: emp_deatails_display_rect.height/20
            anchors.left: parent.left
            anchors.leftMargin: emp_deatails_display_rect.width/20

        }
        Text {
            id: emp_name
            text: "Employee name :  "+EmployeeDatabase.empname
            color: "#191641"
            font.bold: true
            font.pixelSize: emp_deatails_display_rect.width/20
            font.family: "Helvetica"
            anchors.top: emp_id.bottom
            anchors.topMargin: emp_deatails_display_rect.height/20
            anchors.left: parent.left
            anchors.leftMargin: emp_deatails_display_rect.width/20
        }
        Text {
            id: desc_txt
            text: "Has been allotted following assets for\nsupporting work from home/office"
            font.bold: true
            font.pixelSize: emp_deatails_display_rect.width/20
            font.family: "Helvetica"
            anchors.top: emp_name.bottom
            anchors.topMargin: emp_deatails_display_rect.height/20
            anchors.left: parent.left
            anchors.leftMargin: emp_deatails_display_rect.width/20
        }
    }

    Rectangle{
        id:emp_operation_rect
        width: authority_assets_provide_page.width
        height: authority_assets_provide_page.height/1.4
        radius: 20
        anchors.bottom: parent.bottom
        color: "#ffffff"
        Column{
            id:assets_column
            anchors.fill: emp_operation_rect
            spacing: authority_assets_provide_page.height/30
            anchors.top: emp_operation_rect.top
            anchors.topMargin: emp_operation_rect.height/20
            anchors.horizontalCenter: emp_operation_rect.horizontalCenter
            Row{
                id:assets_row_1
                spacing: authority_assets_provide_page.width/10
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
                        _load.source="LaptopAssetsPage.qml"
                        authority_assets_provide_page.visible=false

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
                        _load.source="LaptopBagAssetsPage.qml"
                        authority_assets_provide_page.visible=false
                    }
                }
            }
            Row{
                id:assets_row_2
                spacing: authority_assets_provide_page.width/10
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
                        _load.source="BooksAssetsPage.qml"
                        authority_assets_provide_page.visible=false

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
                        _load.source="OtherAccessoriesAssetsPage.qml"
                        authority_assets_provide_page.visible=false

                    }
                }
            }
            Row{
                id:assets_row_3
                spacing: authority_assets_provide_page.width/10
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
                        //                        authority_assets_provide_page.visible=false

                    }
                }
                Button{
                    id:viewemployeebutton
                    width: emp_operation_rect.width/3
                    height: emp_operation_rect.height/4
                    background: Rectangle{
                        id:view_emp_bg_rect
                        anchors.fill: parent
                        radius: bookbutton.width/30
                        color: "#635AD9"
                        Image {
                            id: view_emp_img
                            width: emp_operation_rect.width/5
                            height: emp_operation_rect.height/6
                            anchors.top: parent.top
                            anchors.topMargin: view_emp_bg_rect.height/20
                            anchors.horizontalCenter: view_emp_bg_rect.horizontalCenter
                            source: "ApplicationImages/icons/employee.png"
                        }
                        Text {
                            id: view_emp_img_txt
                            text:"Employee Assets"
                            color: "#252525"
                            font.bold: true
                            font.pixelSize: otherbutton.width/8
                            font.family: "Helvetica"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: view_emp_bg_rect.horizontalCenter
                            anchors.bottomMargin: view_emp_bg_rect.height/20
                        }
                    }
                    onPressed: {
                        view_emp_bg_rect.color="#FAF9F8"
                        view_emp_img_txt.color="#635AD9"

                    }
                    onReleased: {
                        view_emp_bg_rect.color="635AD9"
                        view_emp_img_txt.color="#252525"

                    }
                    onClicked: {
                        console.log("Authority Assets Provide Page View Employee Button Clicked")
                        _load.source="AuthorityDisplayEmployeeDeatailsPage.qml"
                        authority_assets_provide_page.visible=false

                    }

                }

            }
        }
    }
    Button{
        id:backbutton
        width: authority_assets_provide_page.width/7
        height: authority_assets_provide_page.height/13
        anchors.top: authority_assets_provide_page.top
        anchors.left: authority_assets_provide_page.left
        anchors.topMargin: authority_assets_provide_page.height/80
        anchors.leftMargin: authority_assets_provide_page.width/80
        background: Rectangle{
            id:back_button_bg_rect
            anchors.fill: parent
            color: "transparent"
            radius: backbutton.width/30
            Image {
                id: back_button_image
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
            console.log("Authority Assets Provide Page Back Button Clicked")
            _load.source="AuthorityServicepage.qml"
            authority_assets_provide_page.visible=false

        }
    }
    Component.onCompleted: {
        console.log("Authority Assets Provide Page Constructor")
    }
    Component.onDestruction: {
        console.log("Authority Assets Provide Page Distructor")
    }


}










