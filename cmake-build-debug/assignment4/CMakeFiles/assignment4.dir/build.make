# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug

# Include any dependencies generated for this target.
include assignment4/CMakeFiles/assignment4.dir/depend.make

# Include the progress variables for this target.
include assignment4/CMakeFiles/assignment4.dir/progress.make

# Include the compile flags for this target's objects.
include assignment4/CMakeFiles/assignment4.dir/flags.make

assignment4/CMakeFiles/assignment4.dir/main.cpp.o: assignment4/CMakeFiles/assignment4.dir/flags.make
assignment4/CMakeFiles/assignment4.dir/main.cpp.o: ../assignment4/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object assignment4/CMakeFiles/assignment4.dir/main.cpp.o"
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/assignment4.dir/main.cpp.o -c /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/assignment4/main.cpp

assignment4/CMakeFiles/assignment4.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/assignment4.dir/main.cpp.i"
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/assignment4/main.cpp > CMakeFiles/assignment4.dir/main.cpp.i

assignment4/CMakeFiles/assignment4.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/assignment4.dir/main.cpp.s"
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/assignment4/main.cpp -o CMakeFiles/assignment4.dir/main.cpp.s

assignment4/CMakeFiles/assignment4.dir/main.cpp.o.requires:

.PHONY : assignment4/CMakeFiles/assignment4.dir/main.cpp.o.requires

assignment4/CMakeFiles/assignment4.dir/main.cpp.o.provides: assignment4/CMakeFiles/assignment4.dir/main.cpp.o.requires
	$(MAKE) -f assignment4/CMakeFiles/assignment4.dir/build.make assignment4/CMakeFiles/assignment4.dir/main.cpp.o.provides.build
.PHONY : assignment4/CMakeFiles/assignment4.dir/main.cpp.o.provides

assignment4/CMakeFiles/assignment4.dir/main.cpp.o.provides.build: assignment4/CMakeFiles/assignment4.dir/main.cpp.o


# Object files for target assignment4
assignment4_OBJECTS = \
"CMakeFiles/assignment4.dir/main.cpp.o"

# External object files for target assignment4
assignment4_EXTERNAL_OBJECTS =

assignment4/assignment4: assignment4/CMakeFiles/assignment4.dir/main.cpp.o
assignment4/assignment4: assignment4/CMakeFiles/assignment4.dir/build.make
assignment4/assignment4: /usr/local/lib/libGLEW.dylib
assignment4/assignment4: /usr/local/lib/libglfw.dylib
assignment4/assignment4: assignment4/CMakeFiles/assignment4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable assignment4"
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/assignment4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
assignment4/CMakeFiles/assignment4.dir/build: assignment4/assignment4

.PHONY : assignment4/CMakeFiles/assignment4.dir/build

assignment4/CMakeFiles/assignment4.dir/requires: assignment4/CMakeFiles/assignment4.dir/main.cpp.o.requires

.PHONY : assignment4/CMakeFiles/assignment4.dir/requires

assignment4/CMakeFiles/assignment4.dir/clean:
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 && $(CMAKE_COMMAND) -P CMakeFiles/assignment4.dir/cmake_clean.cmake
.PHONY : assignment4/CMakeFiles/assignment4.dir/clean

assignment4/CMakeFiles/assignment4.dir/depend:
	cd /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/assignment4 /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4 /Users/scottgoerzen/Desktop/CSC_305/Lab7/icg/cmake-build-debug/assignment4/CMakeFiles/assignment4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : assignment4/CMakeFiles/assignment4.dir/depend

