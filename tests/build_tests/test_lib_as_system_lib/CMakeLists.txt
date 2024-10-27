# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

add_subdirectory(external/simple_cpp_project/)

set(TARGET_NAME test_lib_as_system_lib)

project(${TARGET_NAME})

simple_cpp_project_create_application(
    ${TARGET_NAME}
    SOURCES
        main.cc
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
    FIND_PACKAGES
        "HelloWorld REQUIRED"
    LINK_LIBRARIES
        hello_world::core
)
