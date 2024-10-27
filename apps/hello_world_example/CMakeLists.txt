# Copyright (C) 2024 twyleg
set(TARGET_NAME hello_world_example)

simple_cpp_project_create_application(
    ${TARGET_NAME}
    SOURCES
        main.cc
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
    LINK_LIBRARIES
        hello_world::core
)
