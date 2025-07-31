import QtQuick
import QtQuick.Layouts

Rectangle {
    required property var size;

    color: "transparent"

    Layout.alignment: Qt.AlignHCenter
    Layout.fillWidth: true
    implicitHeight: size
}
