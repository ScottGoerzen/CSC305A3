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
CMAKE_SOURCE_DIR = /Users/scottgoerzen/Desktop/CSC_305/CSC305A3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug

# Include any dependencies generated for this target.
include mouse/CMakeFiles/mouse.dir/depend.make

# Include the progress variables for this target.
include mouse/CMakeFiles/mouse.dir/progress.make

# Include the compile flags for this target's objects.
include mouse/CMakeFiles/mouse.dir/flags.make

mouse/CMakeFiles/mouse.dir/main.cpp.o: mouse/CMakeFiles/mouse.dir/flags.make
mouse/CMakeFiles/mouse.dir/main.cpp.o: ../mouse/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object mouse/CMakeFiles/mouse.dir/main.cpp.o"
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mouse.dir/main.cpp.o -c /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/mouse/main.cpp

mouse/CMakeFiles/mouse.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mouse.dir/main.cpp.i"
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/mouse/main.cpp > CMakeFiles/mouse.dir/main.cpp.i

mouse/CMakeFiles/mouse.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mouse.dir/main.cpp.s"
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/mouse/main.cpp -o CMakeFiles/mouse.dir/main.cpp.s

mouse/CMakeFiles/mouse.dir/main.cpp.o.requires:

.PHONY : mouse/CMakeFiles/mouse.dir/main.cpp.o.requires

mouse/CMakeFiles/mouse.dir/main.cpp.o.provides: mouse/CMakeFiles/mouse.dir/main.cpp.o.requires
	$(MAKE) -f mouse/CMakeFiles/mouse.dir/build.make mouse/CMakeFiles/mouse.dir/main.cpp.o.provides.build
.PHONY : mouse/CMakeFiles/mouse.dir/main.cpp.o.provides

mouse/CMakeFiles/mouse.dir/main.cpp.o.provides.build: mouse/CMakeFiles/mouse.dir/main.cpp.o


# Object files for target mouse
mouse_OBJECTS = \
"CMakeFiles/mouse.dir/main.cpp.o"

# External object files for target mouse
mouse_EXTERNAL_OBJECTS =

mouse/mouse: mouse/CMakeFiles/mouse.dir/main.cpp.o
mouse/mouse: mouse/CMakeFiles/mouse.dir/build.make
mouse/mouse: /usr/local/lib/libGLEW.dylib
mouse/mouse: /usr/local/lib/libglfw.dylib
mouse/mouse: mouse/CMakeFiles/mouse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable mouse"
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mouse.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mouse/CMakeFiles/mouse.dir/build: mouse/mouse

.PHONY : mouse/CMakeFiles/mouse.dir/build

mouse/CMakeFiles/mouse.dir/requires: mouse/CMakeFiles/mouse.dir/main.cpp.o.requires

.PHONY : mouse/CMakeFiles/mouse.dir/requires

mouse/CMakeFiles/mouse.dir/clean:
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse && $(CMAKE_COMMAND) -P CMakeFiles/mouse.dir/cmake_clean.cmake
.PHONY : mouse/CMakeFiles/mouse.dir/clean

mouse/CMakeFiles/mouse.dir/depend:
	cd /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/scottgoerzen/Desktop/CSC_305/CSC305A3 /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/mouse /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse /Users/scottgoerzen/Desktop/CSC_305/CSC305A3/cmake-build-debug/mouse/CMakeFiles/mouse.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mouse/CMakeFiles/mouse.dir/depend

