cmake_minimum_required(VERSION 3.16)

project(QtCanvas VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(QT_QML_GENERATE_QMLLS_INI ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

add_subdirectory(ui)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Qt6::Quick
        uiplugin  # auto-generated target from qt_add_qml_module (target + plugin)
)
