# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.


# Prefer bmake.  On the BSD systems the system make is already a BSD make, so
# plain ``make`` is accepted as well.  GNU make is used only as a last resort;
# the generated makefiles avoid GNU make specific syntax either way.
find_program(CMAKE_MAKE_PROGRAM NAMES bmake make gmake)
mark_as_advanced(CMAKE_MAKE_PROGRAM)
