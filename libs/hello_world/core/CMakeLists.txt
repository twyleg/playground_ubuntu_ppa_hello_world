# Copyright (C) 2024 twyleg

include(CMakePrintHelpers)


function(create_lib name)

    set(options
        STATIC
        SHARED
        LOCAL_TARGET
    )

    set(oneValueArgs
        MODULE
        NAMESPACE
    )

    set(multiValueArgs
        DEPS
        SOURCES
        HEADERS
    )

    cmake_parse_arguments("" "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    message(CHECK_START "Creating lib")
    list(APPEND CMAKE_MESSAGE_INDENT "  ")

    cmake_language(GET_MESSAGE_LOG_LEVEL MESSAGE_LOG_LEVEL)
    if("${MESSAGE_LOG_LEVEL}" MATCHES "VERBOSE|DEBUG|TRACE")
        cmake_print_variables(_MODULE)
        cmake_print_variables(_NAMESPACE)

        cmake_print_variables(_SHARED)
        cmake_print_variables(_STATIC)
        cmake_print_variables(_LOCAL_TARGET)

        cmake_print_variables(_SOURCES)
        cmake_print_variables(_HEADERS)
    endif()

    set(TARGET_NAME "${_NAMESPACE}_${_MODULE}")

    #
    # Main target
    #
    add_library(${TARGET_NAME}_obj OBJECT
        ${_SOURCES}
        ${_HEADERS}
    )
    set_property(TARGET ${TARGET_NAME}_obj PROPERTY POSITION_INDEPENDENT_CODE 1)

    set_target_properties(${TARGET_NAME}_obj
        PROPERTIES
            CXX_STANDARD 20
            INCLUDE_CURRENT_DIR ON
    )

    target_link_libraries(${TARGET_NAME}_obj
        ${_DEPS}
    )

    if(${_STATIC})
        message(CHECK_START "Creating static lib target")

        add_library(${TARGET_NAME}_static STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
        add_library("${MODULE}_static" ALIAS ${TARGET_NAME}_static)

        target_sources(${TARGET_NAME}_static
            PUBLIC
                FILE_SET HEADERS
                    BASE_DIRS
                        ${CMAKE_CURRENT_SOURCE_DIR}/../../
                    FILES
                        ${HEADERS}
        )

        message(CHECK_PASS "Done!")
    endif()

    if(${_SHARED})
        message(CHECK_START "Creating shared lib target")

        add_library(${TARGET_NAME}_shared SHARED $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
        add_library("${MODULE}_shared" ALIAS ${TARGET_NAME}_shared)

        target_sources(${TARGET_NAME}_shared
            PUBLIC
                FILE_SET HEADERS
                    BASE_DIRS
                        ${CMAKE_CURRENT_SOURCE_DIR}/../../
                    FILES
                        ${HEADERS}
        )

        message(CHECK_PASS "Done!")
    endif()

    if(${_LOCAL_TARGET})
        message(CHECK_START "Creating local lib target")

        add_library(${name} STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
        # add_library("${NAMESPACE}::${MODULE}" ALIAS ${TARGET_NAME}_local)

        target_include_directories(${name}
            PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../
        )

        # set("${TARGET_NAME}_local" ${${TARGET_NAME}_local} PARENT_SCOPE)
        # # set("${NAMESPACE}::${MODULE}" "${${NAMESPACE}::${MODULE}}" PARENT_SCOPE)

        # set("Foo" 42 PARENT_SCOPE)

        message(CHECK_PASS "Done!")
    endif()

    list(POP_BACK CMAKE_MESSAGE_INDENT)
    message(CHECK_PASS "created")

endFunction()


#
# find packages
#
find_package(fmt REQUIRED)


create_lib(
    core
    LOCAL_TARGET
    MODULE
        core
    NAMESPACE
        hello_world
    DEPS
        fmt::fmt
    SOURCES
        hello_world.cc
        hello_world_fmt.cc
    HEADERS
        hello_world.h
        hello_world_fmt.h
)

add_library(hello_world::core ALIAS core)

# set("hello_world_core_local" ${hello_world_core_local} PARENT_SCOPE)

message("Foo: ${hello_world_core_local}")

# set(NAMESPACE hello_world)
# set(MODULE core)

# set(TARGET_NAME "${NAMESPACE}_${MODULE}")

# #
# # find packages
# #
# find_package(fmt REQUIRED)


# set(SRC
#     hello_world.cc
#     hello_world_fmt.cc
# )

# set(HDR
#     hello_world.h
#     hello_world_fmt.h
# )



# #
# # Create the "main" target
# #
# add_library(${TARGET_NAME}_obj OBJECT)
# set_property(TARGET ${TARGET_NAME}_obj PROPERTY POSITION_INDEPENDENT_CODE 1)

# # Add sources
# target_sources(${TARGET_NAME}_obj
#     PRIVATE
#         ${SRC}
#     PUBLIC
#         FILE_SET HEADERS
#             BASE_DIRS
#                 ${CMAKE_CURRENT_SOURCE_DIR}/../../
#             FILES
#                 ${HDR}
# )

# # Set target properties
# set_target_properties(${TARGET_NAME}_obj
#     PROPERTIES
#         CXX_STANDARD 20
#         INCLUDE_CURRENT_DIR ON
# )

# set(DEPS
#     fmt::fmt
# )

# target_link_libraries(${TARGET_NAME}_obj
#     ${DEPS}
# )


# # Create "static" and "shared" library
# add_library(${MODULE}_static STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
# add_library(${MODULE}_shared SHARED $<TARGET_OBJECTS:${TARGET_NAME}_obj>)

# target_sources(${MODULE}_shared
#     PUBLIC
#         FILE_SET HEADERS
#             BASE_DIRS
#                 ${CMAKE_CURRENT_SOURCE_DIR}/../../
#             FILES
#                 ${HDR}
# )


# # Create a "static" library as a local target for CMake
# add_library(${TARGET_NAME}_local STATIC $<TARGET_OBJECTS:${TARGET_NAME}_obj>)
# add_library("${NAMESPACE}::${MODULE}" ALIAS ${TARGET_NAME}_local)

# target_include_directories("${TARGET_NAME}_local"
#     PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../
# )




# #
# # link against libs
# #

# # set(DEPS
# #     fmt::fmt
# # )

# target_link_libraries(${TARGET_NAME}_local
#     ${DEPS}
# )

# target_link_libraries(${MODULE}_shared
#     ${DEPS}
# )

# target_link_libraries(${MODULE}_static
#     ${DEPS}
# )


# #
# # add parent folder to targets include directories
# #
# # target_include_directories("${TARGET_NAME}_local"
# #     PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../
# # )
