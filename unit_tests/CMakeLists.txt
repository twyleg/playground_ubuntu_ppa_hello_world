# Copyright (C) 2024 twyleg
set(TARGET_NAME unit_tests)


#
# Add source files to target
#
add_executable(${TARGET_NAME}
    hello_world_test.cc
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
    GTest::gmock_main
    GTest::gtest_main
)
