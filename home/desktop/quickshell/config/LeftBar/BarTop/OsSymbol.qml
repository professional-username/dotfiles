import QtQuick
import QtQuick.Layouts

Item {
    id: osSymbol
    implicitWidth: 48
    implicitHeight: 48

    Layout.alignment: Qt.AlignHCenter

    // border.color: this.palette.link
    // border.width: 3
    // // centerIn: parent
    
    // property string distroName: getDistroName()
    
    property string distroIcon: "\uf313"

    Text {
        id: distroText
        anchors.centerIn: parent
        
        font.family: "Nerd Fonts"
        font.pixelSize: Math.min(parent.width, parent.height) * 0.75
        text: osSymbol.distroIcon
        
        color: this.palette.link
        opacity: enabled ? 1.0 : 0.5
    }
}
