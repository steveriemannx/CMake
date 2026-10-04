# The generated makefiles must use the BSD make ``.include`` directive and
# must not contain GNU make specific output.

set(failed "")

set(build_make "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/bsdmain.dir/build.make")
if(NOT EXISTS "${build_make}")
  string(APPEND failed "Expected generated file not found: ${build_make}\n")
else()
  file(READ "${build_make}" build_make_content)
  if(NOT build_make_content MATCHES "(^|\n)\\.include ")
    string(APPEND failed
      "${build_make} does not use the BSD make '.include' directive\n")
  endif()
  if(build_make_content MATCHES "(^|\n)include ")
    string(APPEND failed
      "${build_make} uses the GNU make 'include' directive\n")
  endif()
endif()

set(root_make "${RunCMake_TEST_BINARY_DIR}/Makefile")
if(NOT EXISTS "${root_make}")
  string(APPEND failed "Expected generated file not found: ${root_make}\n")
else()
  file(READ "${root_make}" root_make_content)
  if(root_make_content MATCHES "CMAKE_USES_TERMINAL_PREFIX")
    string(APPEND failed
      "GNU make job server prefix emitted by the BSD makefiles generator\n")
  endif()
endif()

set(cache "${RunCMake_TEST_BINARY_DIR}/CMakeCache.txt")
if(NOT EXISTS "${cache}")
  string(APPEND failed "Expected generated file not found: ${cache}\n")
else()
  file(READ "${cache}" cache_content)
  if(NOT cache_content MATCHES "CMAKE_GENERATOR:INTERNAL=BSD Makefiles")
    string(APPEND failed "Unexpected generator recorded in the cache\n")
  endif()
  if(NOT cache_content MATCHES "CMAKE_MAKE_PROGRAM:[^=]*=.")
    string(APPEND failed "No make program recorded in the cache\n")
  endif()
endif()

if(failed)
  string(APPEND RunCMake_TEST_FAILED "${failed}")
endif()
