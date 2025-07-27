import Quickshell // for PanelWindow
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

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

            implicitWidth: 50

            ColumnLayout {
                // border.color: "black"
                anchors.fill: parent
                spacing: 5

                ClockWidget {
                    Layout.alignment: Qt.AlignTop
                    Layout.fillHeight: true
                }

                Colors {
                    // Layout.alignment: Qt.AlignVCenter
                    // Layout.fillHeight: true
                }

                ClockWidget {
                    Layout.alignment: Qt.AlignBottom
                    Layout.fillHeight: true
                }
                
            }
        }
    }
}
