# Copyright (C) 2024 twyleg
set(TARGET_NAME hello_world_example)


#
# Add source files to target
#
add_executable(${TARGET_NAME}
    main.cc
)


#
# Set target properties
#
set_target_properties(${TARGET_NAME}
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
)


#
# Link against libs
#
target_link_libraries(${TARGET_NAME}
    hello_world::core
)
