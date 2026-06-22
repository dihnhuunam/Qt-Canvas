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
        z: configurePane.z + 1
        propagateComposedEvents: true
        onPressed: function (mouse) {
            rightPane.forceActiveFocus();
            mouse.accepted = false;
        }
    }

    ScrollView {
        id: configurePane
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        contentWidth: availableWidth

        ColumnLayout {
            width: configurePane.availableWidth - configurePane.ScrollBar.vertical.width - 2

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
                        labelText: "IP"
                        placeholderText: "Enter IP"
                        Layout.fillWidth: true
                        validator: RegularExpressionValidator {
                            regularExpression: /^((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$/
                        }
                        onEditingFinished: text => configureViewModel.ipAddress = text
                    }

                    CustomLine {
                        id: port
                        labelText: "Port"
                        placeholderText: "Enter Port"
                        Layout.fillWidth: true
                        validator: IntValidator {
                            bottom: 0
                            top: 65535
                        }
                        onEditingFinished: text => configureViewModel.port = parseInt(text)
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
                        labelText: "Amplitude"
                        placeholderText: "Enter amplitude"
                        validator: DoubleValidator {
                            decimals: 3
                        }
                        Layout.fillWidth: true
                        onEditingFinished: text => {
                            const value = parseFloat(text);
                            if (!isNaN(value)) {
                                configureViewModel.amplitude = value;
                                console.log("Amplitude:", value);
                            }
                        }
                    }
                    CustomLine {
                        labelText: "Frequency"
                        placeholderText: "Enter Frequency"
                        validator: DoubleValidator {
                            decimals: 3
                        }
                        Layout.fillWidth: true
                        onEditingFinished: text => {
                            const value = parseFloat(text);
                            if (!isNaN(value)) {
                                configureViewModel.amplitude = value;
                                console.log("Frequency:", value);
                            }
                        }
                    }
                    CustomLine {
                        labelText: "Phase"
                        placeholderText: "Enter Phase"
                        validator: DoubleValidator {
                            decimals: 3
                        }
                        Layout.fillWidth: true
                        onEditingFinished: text => {
                            const value = parseFloat(text);
                            if (!isNaN(value)) {
                                configureViewModel.amplitude = value;
                                console.log("Phase:", value);
                            }
                        }
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
