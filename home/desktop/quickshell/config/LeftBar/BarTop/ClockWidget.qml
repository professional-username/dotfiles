import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.alignment: Qt.AlignHCenter
    implicitHeight: timeLayout.implicitHeight
    
    ColumnLayout {
        id: timeLayout
        anchors.centerIn: parent
        spacing: 0
        
        Text {
            // implicitHeight: 20
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            text: Time.hours

            color: this.palette.link
            font.bold: true
            font.pointSize: 20
        }
        Text {
            // implicitHeight: 20
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            text: Time.minutes

            color: this.palette.link
            font.bold: true
            font.pointSize: 20
        }
    }
    
}


// Rectangle {
//     SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

//     border.color: "white"
//     color: myPalette.window
//     // color: "black"
//     border.width: 4
//     // anchors.horizontalCenter: parent.horizontalCenter
//     Layout.alignment: Qt.AlignHCenter
//     Layout.fillWidth: true
//     // anchors.fill: parent
//     Text {
//         // Layout.alignment: Qt.AlignMiddle
//         anchors.centerIn: parent
//         anchors.
//         // anchors.horizontalCenter: parent.horizontalCenter
//         text: "O"
//         // text: Time.time
//     }
// }
