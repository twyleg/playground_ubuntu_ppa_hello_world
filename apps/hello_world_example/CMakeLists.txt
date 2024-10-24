# Copyright (C) 2024 twyleg

simple_cpp_project_create_application(hello_world_example
    SOURCES
        main.cc
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
    LINK_LIBRARIES
        hello_world::core
)
