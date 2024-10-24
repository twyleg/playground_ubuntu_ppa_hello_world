# Copyright (C) 2024 twyleg
set(COMPONENT_NAME core)
set(PROJECT_NAME hello_world)

if(${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT_NAME})
    set(TARGET_NAME "${COMPONENT_NAME}")
else()
    set(TARGET_NAME "${PROJECT_NAME}_${COMPONENT_NAME}")
endif()

simple_cpp_project_create_library(
    ${TARGET_NAME}
    ALIAS
        ${PROJECT_NAME}::${COMPONENT_NAME}
    SOURCES
        hello_world.cc
        hello_world_fmt.cc
    HEADERS
        hello_world.h
        hello_world_fmt.h
    PROPERTIES
        CXX_STANDARD 20
        INCLUDE_CURRENT_DIR ON
        POSITION_INDEPENDENT_CODE 1
    INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/../../
    FIND_PACKAGES
        "fmt REQUIRED"
        "Boost COMPONENTS REQUIRED system"
    LINK_LIBRARIES
        PUBLIC fmt::fmt
        PRIVATE Boost::system
)
