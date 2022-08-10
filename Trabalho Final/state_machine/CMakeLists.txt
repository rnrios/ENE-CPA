cmake_minimum_required(VERSION 3.17)
project(state_machine)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)
include_directories(inc)
include_directories(src)

add_executable(state_machine
        .idea/workspace.xml
        bin/state_machine_fw
        inc/dev_helper.h
        inc/state_machine.h
        src/state_machine.c
        src/test_1.c
        build.sh
        LEIAME.txt)
