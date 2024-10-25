# Copyright (C) 2024 twyleg

simple_cpp_project_create_application(unit_tests
    SOURCES
        hello_world_test.cc
    PROPERTIES
        CXX_STANDARD 17
        INCLUDE_CURRENT_DIR ON
    LINK_LIBRARIES
        hello_world::core
        GTest::gmock_main
        GTest::gtest_main
)
