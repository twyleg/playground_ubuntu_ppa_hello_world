# Copyright (C) 2024 twyleg

if(${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.23.0")

    install(
        TARGETS core
        EXPORT HelloWorldTargets
        FILE_SET HEADERS
        LIBRARY DESTINATION lib/hello_world
        ARCHIVE DESTINATION lib/hello_world
        INCLUDES DESTINATION include
        RUNTIME DESTINATION bin
    )

else()

    install(
        TARGETS core
        EXPORT HelloWorldTargets
        LIBRARY DESTINATION lib/hello_world
        ARCHIVE DESTINATION lib/hello_world
        RUNTIME DESTINATION bin
    )

    install(
        FILES
            "${CMAKE_SOURCE_DIR}/libs/hello_world/core/hello_world.h"
            "${CMAKE_SOURCE_DIR}/libs/hello_world/core/hello_world_fmt.h"
        DESTINATION include/hello_world/core
    )

endif()

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
        "${CMAKE_SOURCE_DIR}/cmake/HelloWorldConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldConfigVersion.cmake"
    DESTINATION "lib/cmake/HelloWorld"
)
