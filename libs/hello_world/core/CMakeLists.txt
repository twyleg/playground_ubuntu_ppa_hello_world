# Copyright (C) 2024 twyleg
set(NAMESPACE hello_world)
set(MODULE core)

set(TARGET_NAME "${NAMESPACE}_${MODULE}")

#
# find packages
#
find_package(fmt REQUIRED)


set(SRC
    hello_world.cc
    hello_world_fmt.cc
)

set(HDR
    hello_world.h
    hello_world_fmt.h
)


#
# Create the "main" target
#
add_library(${TARGET_NAME}_obj OBJECT)
set_property(TARGET ${TARGET_NAME}_obj PROPERTY POSITION_INDEPENDENT_CODE 1)

# Add sources
target_sources(${TARGET_NAME}_obj
    PRIVATE
        ${SRC}
    PUBLIC
        FILE_SET HEADERS
            BASE_DIRS
                ${CMAKE_CURRENT_SOURCE_DIR}/../../
            FILES
                ${HDR}
)

# Set target properties
set_target_properties(${TARGET_NAME}_obj
    PROPERTIES
        CXX_STANDARD 20
        INCLUDE_CURRENT_DIR ON
)

set(DEPS
    fmt::fmt
)

target_link_libraries(${TARGET_NAME}_obj
    ${DEPS}
)


# Create "static" and "shared" library
add_library(${MODULE}_static STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
add_library(${MODULE}_shared SHARED $<TARGET_OBJECTS:${TARGET_NAME}_obj>)

target_sources(${MODULE}_shared
    PUBLIC
        FILE_SET HEADERS
            BASE_DIRS
                ${CMAKE_CURRENT_SOURCE_DIR}/../../
            FILES
                ${HDR}
)


# Create a "static" library as a local target for CMake
add_library(${TARGET_NAME}_local STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
add_library("${NAMESPACE}::${MODULE}" ALIAS ${TARGET_NAME}_local)

target_include_directories("${TARGET_NAME}_local"
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../
)




#
# link against libs
#

# set(DEPS
#     fmt::fmt
# )

target_link_libraries(${TARGET_NAME}_local
    ${DEPS}
)

target_link_libraries(${MODULE}_shared
    ${DEPS}
)

target_link_libraries(${MODULE}_static
    ${DEPS}
)


#
# add parent folder to targets include directories
#
# target_include_directories("${TARGET_NAME}_local"
#     PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../
# )
