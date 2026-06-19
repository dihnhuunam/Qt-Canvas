import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

RowLayout {
    id: root

    property alias label: label
    property alias textField: textField

    Label {
        id: label
        Layout.preferredWidth: 80
    }

    TextField {
        id: textField
        Layout.fillWidth: true
    }
}
