import QtQuick
import QtQuick.Layouts

Rectangle {
    id: boundingBox
    visible: true
    // Size and layout
    implicitHeight: layout.implicitHeight
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

    border.color: this.palette.link
    color: this.palette.light
    border.width: 3

    ColumnLayout {
        id: layout
        anchors.centerIn: parent

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "O"
            color: this.palette.text
        }
    }
}
