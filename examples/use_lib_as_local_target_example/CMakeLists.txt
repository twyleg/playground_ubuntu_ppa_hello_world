# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

set(TARGET_NAME use_lib_as_local_target_example)

project(${TARGET_NAME})


add_subdirectory(external/hello_world/libs)


#
# add source files to target
#
add_executable(${TARGET_NAME}
    main.cc
)


#
# set target properties
#
set_target_properties(${TARGET_NAME}
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
)


#
# link against libs
#
target_link_libraries(${TARGET_NAME}
    hello_world::core
)
