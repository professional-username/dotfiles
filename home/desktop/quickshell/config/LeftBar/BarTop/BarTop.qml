import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "../Utilities"

Rectangle {
    id: boundingBox
    visible: true
    // Size and layout
    implicitHeight: layout.implicitHeight
    implicitWidth: 50
    // Layout.fillWidth: true
    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

    radius: 6
    // border.color: this.palette.link
    // color: this.palette.alternateBase
    color: "transparent"
    // border.width: 3

    ColumnLayout {
        id: layout
        anchors.centerIn: parent

        BarPadding {size: 10}

        ClockWidget {}

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "O"
            color: this.palette.text
        }
    }
}
