BSD Makefiles Generator
-----------------------

* A new :generator:`BSD Makefiles` generator was added.  It generates
  makefiles for BSD ``make`` (``bmake``), using the BSD make ``.include``
  directive and avoiding GNU make specific behavior, such as the GNU make job
  server protocol and ``--output-sync``.  It is available on all platforms on
  which ``bmake`` (or a BSD ``make``) can be found.

* The ``bootstrap`` script gained support for
  ``--generator="BSD Makefiles"``, allowing CMake itself to be built with the
  BSD makefile generator.
