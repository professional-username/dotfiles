import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {    // implicitWidth: 100
    implicitHeight: 100

    border.color: "black"
    border.width: 4
    // color: "black"
    // anchors.fill: parent
    // anchors.centerIn: parent
    Layout.alignment: Qt.AlignHCenter
    Layout.fillWidth: true
    Layout.fillHeight: true

    // Use the system palette, which should be set by stylix
    SystemPalette { id: stylix; colorGroup: SystemPalette.Active }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 2

        ColorSwatch{ swatchColor: this.palette.link }
        // ColorSwatch{ swatchColor: stylix.link }

        ColorSwatch{ swatchColor: stylix.window }
        ColorSwatch{ swatchColor: stylix.base }
        ColorSwatch{ swatchColor: stylix.alternateBase }
        ColorSwatch{ swatchColor: stylix.button }
        ColorSwatch{ swatchColor: stylix.light }
        ColorSwatch{ swatchColor: stylix.midlight }
        ColorSwatch{ swatchColor: stylix.dark }
        ColorSwatch{ swatchColor: stylix.mid }
        ColorSwatch{ swatchColor: stylix.highlight }
        // Inactive highlight
        ColorSwatch{ swatchColor: stylix.text }
        ColorSwatch{ swatchColor: stylix.windowText }
        ColorSwatch{ swatchColor: stylix.buttonText }
        // Disabled text
        // Tooltip text
        ColorSwatch{ swatchColor: stylix.highlightedText }
        // link
        // link visited

        ColorSwatch{ swatchColor: stylix.placeholderText }
        ColorSwatch{ swatchColor: stylix.shadow }
    }

    component ColorSwatch: Rectangle {
        required property string swatchColor
        color: swatchColor

        implicitHeight: 30
        implicitWidth: 30
        Layout.alignment: Qt.AlignHCenter
    }

}

