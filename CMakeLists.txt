# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

# Externals
set(INSTALL_GTEST False)
add_subdirectory(external/googletest/)
add_subdirectory(external/simple_cpp_project/)

# Setup project
simple_cpp_project_get_version_from_git(VERSION_NUMBER_FULL VERSION_NUMBER)
project(hello_world LANGUAGES CXX VERSION ${VERSION_NUMBER})

# Libs
add_subdirectory(libs/)

# Apps
add_subdirectory(apps/hello_world_example/)

# Unit-Test
add_subdirectory(tests/unit_tests/)

# Include install config
include(cmake/cmake_install.cmake)
