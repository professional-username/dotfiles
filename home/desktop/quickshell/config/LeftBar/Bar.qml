import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "BarTop"
import "BarMiddle"
import "BarBottom"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            id: panel

            anchors {
                bottom: true
                left: true
                top: true
            }
            implicitWidth: 60

            // The coloured rectangle because PanelWindow does not have a palette
            Rectangle{
                anchors.fill: parent
                anchors.centerIn: parent
                color: this.palette.base

                ColumnLayout {
                    anchors.fill: parent

                    BarTop {}

                    BarMiddle {}

                    BarBottom {}
                }
            }
        }
    }
}
