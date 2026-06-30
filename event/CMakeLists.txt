add_library(event STATIC EventDef.h Event.h Event.cpp EventMediator.h
                         EventMediator.cpp)

target_include_directories(event PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
