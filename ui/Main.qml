import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Window {
    id: root

    minimumWidth: 1600
    minimumHeight: 900
    visibility: Window.Maximized
    visible: true
    title: "Signal Replay"

    Material.theme: Material.Dark
    Material.accent: Material.Blue
    Material.primary: Material.BlueGrey
    Material.foreground: Material.White

    RowLayout {
        anchors.fill: parent

        LeftPane {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 8
        }

        RightPane {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 2
        }
    }
}
