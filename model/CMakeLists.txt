add_library(model STATIC Signal/SignalDef.h Signal/Signal.h Signal/Signal.cpp)

target_include_directories(model PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
                                        ${CMAKE_CURRENT_SOURCE_DIR}/Signal)
