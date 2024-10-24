# Copyright (C) 2024 twyleg

include(${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/helper.cmake)

create_application(hello_world_example
    SOURCES
        main.cc
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
    LINK_LIBRARIES
        hello_world::core
)
