import QtQuick 2.0
import QtQuick.Controls 2.5

Item  {
    id: window
    anchors.fill: parent
    property int i:0;
    property bool conditionCheck: false

    state: "summary"
    states: [
        State { name: "summary"; },
        State { name: "details"; }
    ]
    transitions: [
        Transition { from: "summary"; to: "details";
            SequentialAnimation {
                PropertyAction { target: popListView; property: "visible"; value: true; }
                ParallelAnimation {
                    NumberAnimation { target: popListView; properties: "x,y"; to: 0; duration: 300; }
                    NumberAnimation { target: popListView; property: "width"; to: yearlist.width; duration: 300; }
                    NumberAnimation { target: popListView; property: "height"; to: yearlist.height; duration: 300; }
                }
            }
        }
    ]

    Text {
        id: yearText
        text: yrModel.UserSelectedYear
        color: "#ffffff"
        font.bold: true
        font.pixelSize: parent.width/17
        anchors.top: parent.top
        anchors.topMargin: parent.height/40
        anchors.left: parent.left
        anchors.leftMargin:parent.width/30
    }

    //    Rectangle{
    //        id:bleckLinerect
    //        height: 1
    //        width: parent.width/1.1
    //        color: "lightgrey"
    //        anchors.top: yearText.bottom
    //        anchors.topMargin: yearText.height/4
    //        anchors.left: parent.left
    //        anchors.leftMargin:parent.width/20
    //    }

    GridView{
        id:yearlist
        width:parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin:parent.width/30
        anchors.right: parent.right
        anchors.rightMargin:parent.width/80
        anchors.top:yearText.bottom
        //        anchors.top: bleckLinerect.bottom
        anchors.topMargin:  parent.height/40
        cellHeight: parent.height/4.5
        cellWidth: parent.width/3.15
        model: yrModel
        clip: true
        delegate:MonthView{
            currentItemStatus: GridView.isCurrentItem;
            currentMonth:(conditionCheck)?(currentItemStatus? true : false) : false
            onPresentMonth: {
                conditionCheck = true ;
                popListView.open();
                yearlist.currentIndex = index ;
                dateView.ind = index
                var delegateRect = mapToItem(window, x, y);
                delegateRect.width = width; delegateRect.height = height;

                popListView.positionOverSummary(delegateRect);
                dateView.positionViewAtIndex(index, dateView);
                window.state = "details";
            }
        }
        function getDelegateInstanceAt(index) {
            for(var i = 0; i < contentItem.children.length; ++i) {
                var item = contentItem.children[i];

                if (item.objectName == "summaryDelegate" && item.index == index)
                    return item;
            }
            return undefined;
        }
    }
    Popup{
        id:popListView
        property string monthname;
        property var dateModel;
        z:1
        width: root.width
        height: root.height
        visible: false
        function positionOverSummary(summaryRect) {
            x = summaryRect.x; y = summaryRect.y;
            width = summaryRect.width; height = summaryRect.height;
        }
        background: Rectangle{
            id:rect
            color: "black"
        }
        Rectangle{
            id:backbutton
            width:popListView.width/2
            height: popListView.height/20
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
//            anchors.leftMargin: 2
            Row{
                spacing:backbutton.width/10
                Item {
                    id: backText
                    width: backbutton.width/5
                    height: backbutton.height
                    Image {
                        id: backbuttonimg
                        anchors.fill: parent
                        source:"ApplicationImages/icons/back.png"
                    }
                }
                Text {
                    id: presentYearText
                    text: yrModel.UserSelectedYear
                    font.bold: true
                    font.family: "Times New Roman"
                    color: "#ffffff"
                    font.pixelSize:  parent.width/4
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    popListView.close()
                    window.state = "summary";
                    yearlist.opacity = 1;
                }
            }
        }
        ListView{
            property int ind
            id:dateView
            width: popListView.width
            height: popListView.height
            anchors.top: backbutton.bottom
            anchors.topMargin: backbutton.height*(0.4)
            clip: true
            currentIndex: ind
            highlightMoveDuration :0
            model: yrModel
            move: Transition {
                NumberAnimation { properties: "x,y"; duration: 600;easing.type: Easing.OutCirc }
            }
            delegate:InsideMonthView{
                defaultStatus :ListView.isCurrentItem
                currentMonth: defaultStatus ?true :false
                onPresentMonth: {
                    yearlist.positionViewAtIndex(index, GridView.Visible);
                    window.state = "summary";
                }
            }
        }
    }
    Component.onCompleted: {
        console.log("MyGridView Page Construction")
    }
    Component.onDestruction: {
        console.log("MyGridView Page Distruction")
    }
}












//            Column{
//                spacing: 20
//                anchors.top: backbutton.bottom
//                anchors.topMargin: 20
//                Text {
//                    id: mnthName
//                    text:popListView.monthname
//                    color: "black"
//                    font.pixelSize: 25

//                }
//                GridView{
//                    model: popListView.dateModel
//                    id: dateRect2
//                    width:popListView.width
//                    height: popListView.height
//                    cellHeight: parent.height/12
//                    cellWidth: parent.width/7.8
//                    clip: true
//                    delegate: InsideDateView{}
//                }
//            }
//        InsideMonthView{
//            id:dateView
//             property int ind

//            onPresentMonth: {
////                yearlist.positionViewAtIndex(ind, GridView.Visible);
//                indexvalue=ind
//                window.state = "summary";
//            }
//        }
