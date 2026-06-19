add_library(ui STATIC)

qt_add_qml_module(ui
    URI UI
    QML_FILES
        Main.qml
        RightPane.qml
        LeftPane.qml
)
