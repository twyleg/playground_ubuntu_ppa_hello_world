# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

project(hello_world LANGUAGES CXX VERSION 0.0.1)


# Externals
set(INSTALL_GTEST False)
add_subdirectory(external/googletest/)

# Libs
add_subdirectory(libs/)

# Apps
add_subdirectory(apps/hello_world_example/)

# Unit-Test
add_subdirectory(unit_tests/)

# Include install config
include(cmake/cmake_install.cmake)
