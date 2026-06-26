add_library(viewmodel STATIC ConfigureViewModel/ConfigureViewModel.h
                             ConfigureViewModel/ConfigureViewModel.cpp)

target_include_directories(
  viewmodel PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                   ${CMAKE_CURRENT_SOURCE_DIR}/ConfigureViewModel)

find_package(Qt6 REQUIRED COMPONENTS Core)

target_link_libraries(viewmodel PUBLIC Qt6::Core model)
