# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.3.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.3.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/state_machine.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/state_machine.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/state_machine.dir/flags.make

CMakeFiles/state_machine.dir/src/state_machine.c.obj: CMakeFiles/state_machine.dir/flags.make
CMakeFiles/state_machine.dir/src/state_machine.c.obj: CMakeFiles/state_machine.dir/includes_C.rsp
CMakeFiles/state_machine.dir/src/state_machine.c.obj: ../src/state_machine.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/state_machine.dir/src/state_machine.c.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\state_machine.dir\src\state_machine.c.obj   -c "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\state_machine.c"

CMakeFiles/state_machine.dir/src/state_machine.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/state_machine.dir/src/state_machine.c.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\state_machine.c" > CMakeFiles\state_machine.dir\src\state_machine.c.i

CMakeFiles/state_machine.dir/src/state_machine.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/state_machine.dir/src/state_machine.c.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\state_machine.c" -o CMakeFiles\state_machine.dir\src\state_machine.c.s

CMakeFiles/state_machine.dir/src/test_1.c.obj: CMakeFiles/state_machine.dir/flags.make
CMakeFiles/state_machine.dir/src/test_1.c.obj: CMakeFiles/state_machine.dir/includes_C.rsp
CMakeFiles/state_machine.dir/src/test_1.c.obj: ../src/test_1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/state_machine.dir/src/test_1.c.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\state_machine.dir\src\test_1.c.obj   -c "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\test_1.c"

CMakeFiles/state_machine.dir/src/test_1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/state_machine.dir/src/test_1.c.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\test_1.c" > CMakeFiles\state_machine.dir\src\test_1.c.i

CMakeFiles/state_machine.dir/src/test_1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/state_machine.dir/src/test_1.c.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\src\test_1.c" -o CMakeFiles\state_machine.dir\src\test_1.c.s

# Object files for target state_machine
state_machine_OBJECTS = \
"CMakeFiles/state_machine.dir/src/state_machine.c.obj" \
"CMakeFiles/state_machine.dir/src/test_1.c.obj"

# External object files for target state_machine
state_machine_EXTERNAL_OBJECTS =

state_machine.exe: CMakeFiles/state_machine.dir/src/state_machine.c.obj
state_machine.exe: CMakeFiles/state_machine.dir/src/test_1.c.obj
state_machine.exe: CMakeFiles/state_machine.dir/build.make
state_machine.exe: CMakeFiles/state_machine.dir/linklibs.rsp
state_machine.exe: CMakeFiles/state_machine.dir/objects1.rsp
state_machine.exe: CMakeFiles/state_machine.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable state_machine.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\state_machine.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/state_machine.dir/build: state_machine.exe

.PHONY : CMakeFiles/state_machine.dir/build

CMakeFiles/state_machine.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\state_machine.dir\cmake_clean.cmake
.PHONY : CMakeFiles/state_machine.dir/clean

CMakeFiles/state_machine.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine" "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine" "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug" "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug" "C:\Users\Rodrigo\Dropbox\Unb\ENE\CPA\Trabalho Final\state_machine\cmake-build-debug\CMakeFiles\state_machine.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/state_machine.dir/depend

