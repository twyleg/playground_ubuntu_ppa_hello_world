# Copyright (C) 2024 twyleg
set(COMPONENT core)
set(PROJECT hello_world)


if(${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT})
    set(TARGET_NAME "${COMPONENT}")
else()
    set(TARGET_NAME "${PROJECT}_${COMPONENT}")
endif()


#
# Define source and header files
#
set(SOURCES
    hello_world.cc
    hello_world_fmt.cc
)

set(HEADERS
    hello_world.h
    hello_world_fmt.h
)


#
# Find packages
#
find_package(fmt REQUIRED)


#
# Create library targets
#
add_library(${TARGET_NAME}
    ${SOURCES}
    ${HEADERS}
)

add_library("${PROJECT}::${COMPONENT}" ALIAS ${TARGET_NAME})

target_sources(${TARGET_NAME}
    PRIVATE
        ${SOURCES}
    PUBLIC
        FILE_SET HEADERS
            BASE_DIRS
                ${CMAKE_CURRENT_SOURCE_DIR}/../../
            FILES
                ${HEADERS}
)


#
# Set target properties
#
set_target_properties(${TARGET_NAME}
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
        POSITION_INDEPENDENT_CODE 1
)


#
# Link against libs
#
target_link_libraries(${TARGET_NAME}
    fmt::fmt
)


#
# Add parent-parent folder to targets include directories
#
target_include_directories(${TARGET_NAME}
    PUBLIC "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../>"
)
