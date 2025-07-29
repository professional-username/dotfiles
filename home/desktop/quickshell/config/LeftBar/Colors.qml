import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitWidth: layout.width + 10
    implicitHeight: layout.height + 10

    color: this.palette.base
    Layout.alignment: Qt.AlignHCenter
    Layout.fillWidth: true
    // Layout.fillHeight: true

    ColumnLayout {
        anchors.centerIn: parent
        id: layout
        spacing: 4

        // Links (Also the 2 main accent colours of the theme)
        ColorSwatch{ swatchColor: this.palette.link }
        ColorSwatch{ swatchColor: this.palette.linkVisited }

        // Base colours
        ColorSwatch{ swatchColor: this.palette.base }
        ColorSwatch{ swatchColor: this.palette.alternateBase }
        ColorSwatch{ swatchColor: this.palette.window } // Same as alt base
        ColorSwatch{ swatchColor: this.palette.button } // Lighter than alt base

        // Text colours
        ColorSwatch{ swatchColor: this.palette.text }
        // ColorSwatch{ swatchColor: this.palette.windowText } // Same as Text
        // ColorSwatch{ swatchColor: this.palette.buttonText } // Text

        // ---------------------------------------------------

        // Different shades
        ColorSwatch{ swatchColor: this.palette.dark } // base
        ColorSwatch{ swatchColor: this.palette.light } // light

        // Highlighted (repeates of above, if ever needed for reference)
        ColorSwatch{ swatchColor: this.palette.highlight } // Same as light
        ColorSwatch{ swatchColor: this.palette.highlightedText } // Same as text
    }

    component ColorSwatch: Rectangle {
        required property string swatchColor
        border.color: this.palette.alternateBase
        border.width: 3
        radius: 8
        color: swatchColor

        implicitHeight: 30
        implicitWidth: 30
        Layout.alignment: Qt.AlignHCenter
    }

}

