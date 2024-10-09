# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

set(TARGET_NAME hello_world)


project(${TARGET_NAME})



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

install(
	TARGETS ${TARGET_NAME}
	DESTINATION bin/
)
