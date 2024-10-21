# Copyright (C) 2024 twyleg

install(
    TARGETS core
    EXPORT HelloWorldTargets
    FILE_SET HEADERS
    LIBRARY DESTINATION lib/hello_world
    ARCHIVE DESTINATION lib/hello_world
    INCLUDES DESTINATION include
    RUNTIME DESTINATION bin
)

install(
    TARGETS hello_world_example
    RUNTIME DESTINATION bin
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
    FILES
        "cmake/HelloWorldConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldConfigVersion.cmake"
    DESTINATION "lib/cmake/HelloWorld"
)
