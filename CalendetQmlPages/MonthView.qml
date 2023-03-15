import QtQuick 2.0

Rectangle{
 id:monthGrid
 height: parent.height/4.5
 width: parent.width/3.5
 color: "black"
 signal presentMonth();
 property  bool currentItemStatus;
 property bool currentMonth: true

    Column{
        spacing: 2
        Text {
            id: mnth_name
            text: monthname
            font.pixelSize:parent.width/7.5
            color: currentMonth?"blue":"#ffffff"
        }
        GridView{
            model: monthdata
            id: dateRect
            width:yearlist.width/3
            height: yearlist.height/6.5
            cellHeight: parent.height/7.5
            cellWidth: parent.width/7.5
            clip: true
            delegate: DateView{}

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("month selected");
                    presentMonth()

                }
            }
        }
    }
    Component.onCompleted: {
        console.log("MonthView Page Construction")
    }
    Component.onDestruction: {
        console.log("Month View Page Distruction")
    }
}
