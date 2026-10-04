cmake_minimum_required(VERSION 3.20)
project(BSDMakefiles C)

add_library(bsdlib STATIC lib.c)
add_executable(bsdmain main.c)
target_link_libraries(bsdmain PRIVATE bsdlib)
