function(add_imported_library library headers)
    add_library(olcPixelGameEngine::olcPixelGameEngine UNKNOWN IMPORTED)
    set_target_properties(oldPixelGameEngine:olcPixelGameEngine PROPERTIES
        IMPORTED_LOCATION ${library}
        INTERFACE_INCLUDE_DIRECTORIES ${headers}
    )
    set(olcPixelGameEngine_FOUND 1 CACHE INTERNAL "oldPixelGameEngine found" FORCE)
    set(olcPixelGameEngine_LIBRARIES ${library}
        CACHE STRING "Path to olcPixelGameEngine library" FORCE)
    set(olcPixelGameEngine_INCLUDES ${headers}
        CACHE STRING "Path to olcPixelGameEngine headers" FORCE)
    mark_as_advanced(FORCE olcPixelGameEngine_LIBRARIES)
    mark_as_advanced(FORCE olcPixelGameEngine_INCLUDES)
endfunction()

# if paths were given by the user (cmd args) or the configuration stage was performed in the past (cache variables)
if (olcPixelGameEngine_LIBRARIES AND olcPixelGameEngine_INCLUDES)
    add_imported_library(${olcPixelGameEngine_LIBRARIES} ${olcPixelGameEngine_INCLUDES})
    return ()
endif()

#find_dependency is like find-module, but return()s if module is not found (like REQUIRED & QUIET)
include (CMakeFindDependencyMacro)
find_dependency(PNG)
find_dependency(GLEW)
find_dependency(OpenGL)

file(TO_CMAKE_PATH "$ENV{olcPixelGameEngine_DIR}" _olcPixelGameEngineDir)

# search for libolcpixelgameengine or olcpixelgameengine binaries
find_library(olxPixelGameEngine_LIBRARY_PATH NAMES libolcpixelgameengine olcpixelgameengine
    PATHS
        ${_olcPixelGameEngine_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
        # many other paths
        /usr/lib
    NO_DEFAULT_PATH
)

find_paths(olcPixelGameEngine_HEADER_PATH NAMES olcPixelGameEngine.h
    PATHS
        ${_olcPixelGameEngine_DIR}/include
        /usr/include
    NO_DEFAULT_PATH
)
