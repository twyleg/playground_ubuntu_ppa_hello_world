# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)


# Externals
set(INSTALL_GTEST False)
add_subdirectory(external/googletest/)
add_subdirectory(external/simple_cpp_project/)


simple_cpp_project_get_version_from_git(VERSION_NUMBER_FULL VERSION_NUMBER_SHORT)

message("Full: ${VERSION_NUMBER_FULL}, Short: ${VERSION_NUMBER_SHORT}")


project(hello_world LANGUAGES CXX VERSION ${VERSION_NUMBER_SHORT})


message(${CMAKE_PROJECT_VERSION})




# Libs
add_subdirectory(libs/)

# Apps
add_subdirectory(apps/hello_world_example/)

# # Unit-Test
add_subdirectory(unit_tests/)

# Include install config
include(cmake/cmake_install.cmake)









# include(FetchContent)
# FetchContent_Declare(
#   googletest
#   GIT_REPOSITORY https://github.com/google/googletest.git
#   GIT_TAG        v1.15.2
# )

# FetchContent_Declare(
#   simple_cpp_project
#   GIT_REPOSITORY https://github.com/twyleg/simple_cpp_project.git
#   GIT_TAG        8279e1c66a26520a123120d6dfc5fe4c608a057d
# )

# FetchContent_MakeAvailable(googletest simple_cpp_project)
