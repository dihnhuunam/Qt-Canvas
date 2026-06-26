cmake_minimum_required(VERSION 3.16)

project(
  QtCanvas
  VERSION 0.1
  LANGUAGES CXX)

# C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QML tooling/output settings
set(QT_QML_GENERATE_QMLLS_INI ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

# Qt dependencies
find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

# Enable proper qmldir generation for QML subdirectories
qt_policy(SET QTP0004 NEW)

# Application target
qt_add_executable(${PROJECT_NAME} main.cpp)

# Internal modules
add_subdirectory(ui)
add_subdirectory(model)
add_subdirectory(viewmodel)

# Link dependencies
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Quick Qt6::QuickControls2 ui
                                              model viewmodel)
