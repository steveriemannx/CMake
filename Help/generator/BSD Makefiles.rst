BSD Makefiles
-------------

.. versionadded:: 4.5

Generates makefiles for use with BSD ``make`` (``bmake``).

Use this generator on systems whose native ``make`` is a BSD make, such as
FreeBSD, NetBSD, OpenBSD, or DragonFly BSD.  It is also usable on any other
system on which ``bmake`` is installed.

The generated makefiles use the BSD make ``.include`` directive and avoid GNU
make specific syntax, such as the GNU make job server protocol and
``--output-sync``.  BSD make's own ``-J`` job server is honored.  This
generator does not use the :prop_rule:`JOB_SERVER_AWARE` property.

The make program is looked up preferring ``bmake``, then ``make``, and finally
``gmake``.  The selected program is recorded in
:variable:`CMAKE_MAKE_PROGRAM` and is used by the
:option:`cmake --build <cmake --build>` mode.  Build the project by running
that program, for example:

.. code-block:: console

  $ cmake -S . -B build -G "BSD Makefiles"
  $ cmake --build build

CMake itself may also be bootstrapped with this generator:

.. code-block:: console

  $ ./bootstrap --generator="BSD Makefiles"
