import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    property string bordercolor
    property string  placeholdertext1
    property string placeholderTextColor
    property real fontSize
    property real setEchoMode
    property real setInputMethodHints
    property string textcolor
    property string lineColor
    property alias textt: textField.text
    property string backgroundColor
    property real textFieldWidth
    property real textFieldHeight
    property string textFieldIcon
    property real rectRadius
    property bool fontbold
    height: textFieldHeight
    width: textFieldWidth
    TextField {
        id:textField
        echoMode: setEchoMode
        inputMethodHints:setInputMethodHints
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: parent.width -50
        maximumLength: 30
        placeholderText: placeholdertext1
        textColor: textcolor
        font.pixelSize: fontSize
        font.family: "Times New Roman"
        font.bold: fontbold
        style: TextFieldStyle {
            placeholderTextColor: placeholderTextColor
            background: Rectangle{
                anchors.fill: parent
                color: backgroundColor
                border.width: 1.5
                radius: rectRadius
                border.color: bordercolor
                Image{
                    source: textFieldIcon
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.left
                    height: 20
                    width: 20
                }
            }
        }
    }
    Rectangle{
        anchors.top: parent.bottom
        height: 1;
        width: parent.width
        color: lineColor
    }

}
