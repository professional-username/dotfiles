import QtQuick
import QtQuick.Layouts

// Item {
//     // Set margin
//     MarginWrapperManager { margin: 5 }

//     Rectangle {
//         implicitWidth: 50
//         implicitHeight: 50
//     }

// }


Rectangle {
    SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

    border.color: "white"
    color: myPalette.window
    // color: "black"
    border.width: 4
    // anchors.horizontalCenter: parent.horizontalCenter
    Layout.alignment: Qt.AlignHCenter
    Layout.fillWidth: true
    // anchors.fill: parent
    Text {
        // Layout.alignment: Qt.AlignMiddle
        anchors.centerIn: parent
        // anchors.horizontalCenter: parent.horizontalCenter
        text: "O"
        // text: Time.time
    }
}
