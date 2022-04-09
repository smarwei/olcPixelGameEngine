cmake_minimum_required(VERSION 3.16...3.18)

project(
    OlcPixelGameEngine
    VERSION 0.1
    LANGUAGES CXX
)

add_library(olcPixelGameEngine olcPixelGameEngine.h)
target_include_directories(olcPixelGameEngine PUBLIC .)
target_compile_features(olcPixelGameEngine PRIVATE cxx_std_17)
set_target_properties(olcPixelGameEngine  PROPERTIES LINKER_LANGUAGE CXX)

find_package(nlohmann_json 3.2.0 REQUIRED)
find_package(PNG REQUIRED)
find_package(GLEW REQUIRED)  # necessary?
find_package(OpenGL REQUIRED)
find_package(X11 REQUIRED)
target_link_libraries(olcPixelGameEngine PRIVATE nlohmann_json::nlohmann_json)
target_link_libraries(olcPixelGameEngine PRIVATE PNG::PNG)
target_link_libraries(olcPixelGameEngine PRIVATE OpenGL::GL)
target_link_libraries(olcPixelGameEngine PRIVATE GLEW::glew)
target_link_libraries(olcPixelGameEngine PRIVATE OpenGL::GL)
target_link_libraries(olcPixelGameEngine PRIVATE X11::X11)
#target_link_libraries(olcPixelGameEngine PRIVATE OpenGL:GLU)
#target_link_libraries(olcPixelGameEngine PRIVATE )

add_executable(olcExampleProgram olcExampleProgram.cpp)
target_link_libraries(olcExampleProgram PRIVATE olcPixelGameEngine)

