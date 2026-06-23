import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

RowLayout {
    id: root

    // Public API
    // Label
    property string labelText: ""
    property int labelPixelSize: 16
    property int labelWidth: 80

    // TextField
    property string textFieldText: ""
    property string placeholderText: ""
    property var validator: null
    property bool readOnly: false
    signal editingFinished(string text)
    signal textEdited(string text)

    Label {
        text: root.labelText
        font.pixelSize: root.labelPixelSize
        Layout.preferredWidth: root.labelWidth
        Layout.alignment: Qt.AlignVCenter
    }

    TextField {
        text: root.textFieldText
        placeholderText: root.placeholderText
        validator: root.validator
        readOnly: root.readOnly
        Layout.fillWidth: true

        onTextEdited: root.textEdited(text)
        onEditingFinished: root.editingFinished(text)
    }
}
