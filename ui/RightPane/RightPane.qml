import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Rectangle {
    id: rightPane
    color: Material.background

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        z: scrollView.z + 1
        propagateComposedEvents: true
        onPressed: function (mouse) {
            rightPane.forceActiveFocus();
            mouse.accepted = false;
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        contentWidth: availableWidth

        ColumnLayout {
            width: scrollView.availableWidth - scrollView.ScrollBar.vertical.width - 2

            Item {
                height: 12
            }

            GroupBox {
                id: communicationGrp
                title: "Communication"
                label: Label {
                    text: parent.title
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: Material.foreground
                }
                Layout.fillWidth: true
                Layout.leftMargin: 12
                Layout.rightMargin: 12

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 8
                    CustomLine {
                        id: ip
                        label.text: "IP"
                        label.font.pixelSize: 16
                        textField.placeholderText: "Enter IP"
                        Layout.fillWidth: true
                    }
                    CustomLine {
                        id: port
                        label.text: "Port"
                        label.font.pixelSize: 16
                        textField.placeholderText: "Enter Port"
                        Layout.fillWidth: true
                    }
                    Button {
                        text: "Connect"
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                }
            }

            GroupBox {
                id: paramGrp
                title: "Parameters"
                label: Label {
                    text: parent.title
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: Material.foreground
                }
                Layout.fillWidth: true
                Layout.leftMargin: 12
                Layout.rightMargin: 12
                Layout.topMargin: 8

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 8
                    CustomLine {
                        label.text: "Amplitude"
                        label.font.pixelSize: 16
                        textField.placeholderText: "Enter Amplitude"
                        Layout.fillWidth: true
                    }
                    CustomLine {
                        label.text: "Frequency"
                        label.font.pixelSize: 16
                        textField.placeholderText: "Enter Frequency"
                        Layout.fillWidth: true
                    }
                    CustomLine {
                        label.text: "Phase"
                        label.font.pixelSize: 16
                        textField.placeholderText: "Enter Phase"
                        Layout.fillWidth: true
                    }
                }
            }

            GroupBox {
                id: controlGrp
                title: "Control"
                label: Label {
                    text: parent.title
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: Material.foreground
                }
                Layout.fillWidth: true
                Layout.leftMargin: 12
                Layout.rightMargin: 12
                Layout.topMargin: 8

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 8
                    Button {
                        id: startBtn
                        text: "Start"
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                    Button {
                        id: stopBtn
                        text: "Stop"
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                    Button {
                        id: clearBtn
                        text: "Clear"
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                    Button {
                        id: importBtn
                        text: "Import"
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                }
            }

            Item {
                height: 12
            }
        }
    }
}
