# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qcraft/colmap_test/colmap

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qcraft/colmap_test/colmap/build

# Include any dependencies generated for this target.
include src/exe/CMakeFiles/colmap_exe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.make

# Include the progress variables for this target.
include src/exe/CMakeFiles/colmap_exe.dir/progress.make

# Include the compile flags for this target's objects.
include src/exe/CMakeFiles/colmap_exe.dir/flags.make

src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o: ../src/exe/colmap.cc
src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o -MF CMakeFiles/colmap_exe.dir/colmap.cc.o.d -o CMakeFiles/colmap_exe.dir/colmap.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/colmap.cc

src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/colmap.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/colmap.cc > CMakeFiles/colmap_exe.dir/colmap.cc.i

src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/colmap.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/colmap.cc -o CMakeFiles/colmap_exe.dir/colmap.cc.s

src/exe/CMakeFiles/colmap_exe.dir/database.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/database.cc.o: ../src/exe/database.cc
src/exe/CMakeFiles/colmap_exe.dir/database.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/database.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/database.cc.o -MF CMakeFiles/colmap_exe.dir/database.cc.o.d -o CMakeFiles/colmap_exe.dir/database.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/database.cc

src/exe/CMakeFiles/colmap_exe.dir/database.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/database.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/database.cc > CMakeFiles/colmap_exe.dir/database.cc.i

src/exe/CMakeFiles/colmap_exe.dir/database.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/database.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/database.cc -o CMakeFiles/colmap_exe.dir/database.cc.s

src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o: ../src/exe/feature.cc
src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o -MF CMakeFiles/colmap_exe.dir/feature.cc.o.d -o CMakeFiles/colmap_exe.dir/feature.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/feature.cc

src/exe/CMakeFiles/colmap_exe.dir/feature.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/feature.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/feature.cc > CMakeFiles/colmap_exe.dir/feature.cc.i

src/exe/CMakeFiles/colmap_exe.dir/feature.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/feature.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/feature.cc -o CMakeFiles/colmap_exe.dir/feature.cc.s

src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o: ../src/exe/gui.cc
src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o -MF CMakeFiles/colmap_exe.dir/gui.cc.o.d -o CMakeFiles/colmap_exe.dir/gui.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/gui.cc

src/exe/CMakeFiles/colmap_exe.dir/gui.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/gui.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/gui.cc > CMakeFiles/colmap_exe.dir/gui.cc.i

src/exe/CMakeFiles/colmap_exe.dir/gui.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/gui.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/gui.cc -o CMakeFiles/colmap_exe.dir/gui.cc.s

src/exe/CMakeFiles/colmap_exe.dir/image.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/image.cc.o: ../src/exe/image.cc
src/exe/CMakeFiles/colmap_exe.dir/image.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/image.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/image.cc.o -MF CMakeFiles/colmap_exe.dir/image.cc.o.d -o CMakeFiles/colmap_exe.dir/image.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/image.cc

src/exe/CMakeFiles/colmap_exe.dir/image.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/image.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/image.cc > CMakeFiles/colmap_exe.dir/image.cc.i

src/exe/CMakeFiles/colmap_exe.dir/image.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/image.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/image.cc -o CMakeFiles/colmap_exe.dir/image.cc.s

src/exe/CMakeFiles/colmap_exe.dir/model.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/model.cc.o: ../src/exe/model.cc
src/exe/CMakeFiles/colmap_exe.dir/model.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/model.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/model.cc.o -MF CMakeFiles/colmap_exe.dir/model.cc.o.d -o CMakeFiles/colmap_exe.dir/model.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/model.cc

src/exe/CMakeFiles/colmap_exe.dir/model.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/model.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/model.cc > CMakeFiles/colmap_exe.dir/model.cc.i

src/exe/CMakeFiles/colmap_exe.dir/model.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/model.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/model.cc -o CMakeFiles/colmap_exe.dir/model.cc.s

src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o: ../src/exe/mvs.cc
src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o -MF CMakeFiles/colmap_exe.dir/mvs.cc.o.d -o CMakeFiles/colmap_exe.dir/mvs.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/mvs.cc

src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/mvs.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/mvs.cc > CMakeFiles/colmap_exe.dir/mvs.cc.i

src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/mvs.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/mvs.cc -o CMakeFiles/colmap_exe.dir/mvs.cc.s

src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o: ../src/exe/sfm.cc
src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o -MF CMakeFiles/colmap_exe.dir/sfm.cc.o.d -o CMakeFiles/colmap_exe.dir/sfm.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/sfm.cc

src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/sfm.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/sfm.cc > CMakeFiles/colmap_exe.dir/sfm.cc.i

src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/sfm.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/sfm.cc -o CMakeFiles/colmap_exe.dir/sfm.cc.s

src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o: src/exe/CMakeFiles/colmap_exe.dir/flags.make
src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o: ../src/exe/vocab_tree.cc
src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o: src/exe/CMakeFiles/colmap_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o -MF CMakeFiles/colmap_exe.dir/vocab_tree.cc.o.d -o CMakeFiles/colmap_exe.dir/vocab_tree.cc.o -c /home/qcraft/colmap_test/colmap/src/exe/vocab_tree.cc

src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colmap_exe.dir/vocab_tree.cc.i"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qcraft/colmap_test/colmap/src/exe/vocab_tree.cc > CMakeFiles/colmap_exe.dir/vocab_tree.cc.i

src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colmap_exe.dir/vocab_tree.cc.s"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qcraft/colmap_test/colmap/src/exe/vocab_tree.cc -o CMakeFiles/colmap_exe.dir/vocab_tree.cc.s

# Object files for target colmap_exe
colmap_exe_OBJECTS = \
"CMakeFiles/colmap_exe.dir/colmap.cc.o" \
"CMakeFiles/colmap_exe.dir/database.cc.o" \
"CMakeFiles/colmap_exe.dir/feature.cc.o" \
"CMakeFiles/colmap_exe.dir/gui.cc.o" \
"CMakeFiles/colmap_exe.dir/image.cc.o" \
"CMakeFiles/colmap_exe.dir/model.cc.o" \
"CMakeFiles/colmap_exe.dir/mvs.cc.o" \
"CMakeFiles/colmap_exe.dir/sfm.cc.o" \
"CMakeFiles/colmap_exe.dir/vocab_tree.cc.o"

# External object files for target colmap_exe
colmap_exe_EXTERNAL_OBJECTS =

src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/colmap.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/database.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/feature.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/gui.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/image.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/model.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/mvs.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/sfm.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/vocab_tree.cc.o
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/build.make
src/exe/colmap: src/libcolmap.a
src/exe/colmap: src/libcolmap_cuda.a
src/exe/colmap: src/libcolmap.a
src/exe/colmap: src/libcolmap_cuda.a
src/exe/colmap: lib/FLANN/libflann.a
src/exe/colmap: lib/Graclus/libgraclus.a
src/exe/colmap: lib/LSD/liblsd.a
src/exe/colmap: lib/PBA/libpba.a
src/exe/colmap: lib/PoissonRecon/libpoisson_recon.a
src/exe/colmap: lib/SQLite/libsqlite3.a
src/exe/colmap: lib/SiftGPU/libsift_gpu.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libGLEW.so
src/exe/colmap: lib/VLFeat/libvlfeat.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libboost_filesystem.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libboost_program_options.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libboost_system.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libglog.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libfreeimage.so
src/exe/colmap: /usr/local/lib/libceres.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libglog.so.0.4.0
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libunwind.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.2
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libspqr.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcholmod.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libmetis.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libamd.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcamd.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libccolamd.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcolamd.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libtbb.so.12.5
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcxsparse.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcublas.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcusolver.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcusparse.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/liblapack.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libblas.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libf77blas.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libatlas.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libOpenGL.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libGLX.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libGLU.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libQt5OpenGL.so.5.15.3
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.15.3
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.15.3
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.15.3
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libgmpxx.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libmpfr.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libgmp.so
src/exe/colmap: /usr/lib/x86_64-linux-gnu/libcudart_static.a
src/exe/colmap: /usr/lib/x86_64-linux-gnu/librt.a
src/exe/colmap: src/exe/CMakeFiles/colmap_exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qcraft/colmap_test/colmap/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable colmap"
	cd /home/qcraft/colmap_test/colmap/build/src/exe && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/colmap_exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/exe/CMakeFiles/colmap_exe.dir/build: src/exe/colmap
.PHONY : src/exe/CMakeFiles/colmap_exe.dir/build

src/exe/CMakeFiles/colmap_exe.dir/clean:
	cd /home/qcraft/colmap_test/colmap/build/src/exe && $(CMAKE_COMMAND) -P CMakeFiles/colmap_exe.dir/cmake_clean.cmake
.PHONY : src/exe/CMakeFiles/colmap_exe.dir/clean

src/exe/CMakeFiles/colmap_exe.dir/depend:
	cd /home/qcraft/colmap_test/colmap/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qcraft/colmap_test/colmap /home/qcraft/colmap_test/colmap/src/exe /home/qcraft/colmap_test/colmap/build /home/qcraft/colmap_test/colmap/build/src/exe /home/qcraft/colmap_test/colmap/build/src/exe/CMakeFiles/colmap_exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/exe/CMakeFiles/colmap_exe.dir/depend
