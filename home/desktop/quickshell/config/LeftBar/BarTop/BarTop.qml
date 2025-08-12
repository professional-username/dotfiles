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

    // radius: 6
    color: "transparent"
    // border.color: this.palette.text
    // color: this.palette.alternateBase
    // border.width: 3

    ColumnLayout {
        id: layout
        anchors.centerIn: parent
        // anchors.top: parent.top

        BarPadding {size: 2}

        OsSymbol {}

        ClockWidget {}
    }
}
