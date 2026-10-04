include(RunCMake)

# Configure with the BSD makefile generator explicitly.  Do not inherit the
# make program of the generator driving the test suite.
set(bsd_binary_dir "${RunCMake_BINARY_DIR}/BSDMakefiles")
file(REMOVE_RECURSE "${bsd_binary_dir}")
file(MAKE_DIRECTORY "${bsd_binary_dir}")
set(RunCMake_TEST_BINARY_DIR "${bsd_binary_dir}")
set(RunCMake_TEST_COMMAND_WORKING_DIRECTORY "${bsd_binary_dir}")
run_cmake_command(BSDMakefiles
  ${CMAKE_COMMAND} -G "BSD Makefiles" "${RunCMake_SOURCE_DIR}/BSDMakefiles")

# Build the generated tree with the make program selected by the generator.
set(RunCMake_TEST_NO_CLEAN 1)
run_cmake_command(BSDMakefiles-build ${CMAKE_COMMAND} --build .)
