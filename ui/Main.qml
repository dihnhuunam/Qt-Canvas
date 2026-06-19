import QtQuick
import QtQuick.Layouts

Window {
    id: root
    minimumWidth: 1200
    minimumHeight: 700
    visible: true
    title: "Learning Qt Canvas"

    RowLayout {
        anchors.fill: parent

        LeftPane {}
        RightPane {}
    }
}
