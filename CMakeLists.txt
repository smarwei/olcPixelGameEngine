cmake_minimum_required(VERSION 3.16...3.23)

project(
    olcPixelGameEngine
    VERSION 0.1
    LANGUAGES CXX
)

add_library(olcPixelGameEngine INTERFACE olcPixelGameEngine.h)
target_include_directories(olcPixelGameEngine INTERFACE .)
target_compile_features(olcPixelGameEngine INTERFACE cxx_std_17)
set_target_properties(olcPixelGameEngine PROPERTIES LINKER_LANGUAGE CXX)


IF (WIN32)
    target_link_libraries(olcPixelGameEngine INTERFACE user32 gdi32 opengl32 gdiplus Shlwapi dwmapi)
ELSE()
    find_package(PNG REQUIRED)
    find_package(GLEW REQUIRED)  # necessary?
    find_package(OpenGL REQUIRED)
    find_package(X11 REQUIRED)
    find_package(Threads REQUIRED)
    target_link_libraries(olcPixelGameEngine INTERFACE PNG::PNG)
    target_link_libraries(olcPixelGameEngine INTERFACE OpenGL::GL GLEW::glew)
    target_link_libraries(olcPixelGameEngine INTERFACE X11::X11)
    target_link_libraries(olcPixelGameEngine INTERFACE Threads::Threads)
    #target_link_libraries(olcPixelGameEngine PRIVATE OpenGL:GLU)
    #target_link_libraries(olcPixelGameEngine PRIVATE )
ENDIF()


add_executable(olcExampleProgram olcExampleProgram.cpp)
target_link_libraries(olcExampleProgram PRIVATE olcPixelGameEngine)


# --------------------------------------------------------------------------------------------------------
# Install Targets
# --------------------------------------------------------------------------------------------------------

install(DIRECTORY "./" TYPE INCLUDE)
install(TARGETS olcPixelGameEngine INCLUDES DESTINATION .)
