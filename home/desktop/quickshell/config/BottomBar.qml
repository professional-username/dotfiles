import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick // for Text

Scope {
    Variants {
        model: Quickshell.screens


        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                bottom: true
                left: true
                right: true
            }

            implicitHeight: 30

            ClockWidget {
                anchors.centerIn: parent
            }
        }
    }
}
