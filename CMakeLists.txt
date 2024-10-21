# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

project(hello_world LANGUAGES CXX VERSION 0.0.1)


# Externals
# add_subdirectory(external/googletest/)

# Libs
add_subdirectory(libs/hello_world/core/)

# Apps
add_subdirectory(apps/hello_world)

# Unit-Test
# add_subdirectory(unit_tests/)



install(
    TARGETS core_shared core_static
    EXPORT HelloWorldTargets
    FILE_SET HEADERS
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)

install(
    EXPORT HelloWorldTargets
    FILE HelloWorldTargets.cmake
    NAMESPACE hello_world::
    DESTINATION lib/cmake/HelloWorld
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "HelloWorldConfigVersion.cmake"
    VERSION 0.0.1
    COMPATIBILITY AnyNewerVersion
)

install(
    FILES "cmake/HelloWorldConfig.cmake" "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldConfigVersion.cmake"
    DESTINATION lib/cmake/HelloWorld
)
