=======================================
Clang 4.0.0 (In-Progress) Release Notes
=======================================

.. contents::
   :local:
   :depth: 2

Written by the `LLVM Team <http://llvm.org/>`_

.. warning::

   These are in-progress notes for the upcoming Clang 4.0.0 release. You may
   prefer the `Clang 3.8 Release Notes
   <http://llvm.org/releases/3.8.0/tools/clang/docs/ReleaseNotes.html>`_.

Introduction
============

This document contains the release notes for the Clang C/C++/Objective-C
frontend, part of the LLVM Compiler Infrastructure, release 4.0.0. Here we
describe the status of Clang in some detail, including major
improvements from the previous release and new feature work. For the
general LLVM release notes, see `the LLVM
documentation <http://llvm.org/docs/ReleaseNotes.html>`_. All LLVM
releases may be downloaded from the `LLVM releases web
site <http://llvm.org/releases/>`_.

For more information about Clang or LLVM, including information about
the latest release, please check out the main please see the `Clang Web
Site <http://clang.llvm.org>`_ or the `LLVM Web
Site <http://llvm.org>`_.

Note that if you are reading this file from a Subversion checkout or the
main Clang web page, this document applies to the *next* release, not
the current one. To see the release notes for a specific release, please
see the `releases page <http://llvm.org/releases/>`_.

What's New in Clang 4.0.0?
==========================

Some of the major new features and improvements to Clang are listed
here. Generic improvements to Clang as a whole or to its underlying
infrastructure are described first, followed by language-specific
sections with improvements to Clang's support for those languages.

Major New Features
------------------

- Clang will no longer pass --build-id by default to the linker. In modern
- On Itanium ABI targets, attribute abi_tag is now supported for compatibility
  with GCC. Clang implementation of abi_tag is mostly compatible with GCC ABI
  version 10.

Improvements to Clang's diagnostics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

about them. The improvements since the 3.8 release include:
- -Wcomma is a new warning to show most uses of the builtin comma operator.
- -Wfloat-conversion has two new sub-warnings to give finer grain control for
  floating point to integer conversion warnings.
  - -Wfloat-overflow-convserion detects when a constant floating point value
    is converted to an integer type and will overflow the target type.
  - -Wfloat-zero-conversion detects when a non-zero floating point value is
    converted to a zero integer value.

New Compiler Flags
------------------

The option ....


New Pragmas in Clang
-----------------------

Clang now supports the ...


Attribute Changes in Clang
--------------------------

-  ...

Windows Support
---------------

Clang's support for building native Windows programs ...

Proper support, including correct mangling and overloading, added for
MS-specific "__unaligned" type qualifier.

clang-cl now has limited support for the precompiled header flags /Yc, /Yu, and
/Fp.  If the precompiled header is passed on the compile command with /FI, then
the precompiled header flags are honored.  But if the precompiled header is
included by an `#include <stdafx.h>` in each source file instead of by a
`/FIstdafx.h` flag, these flag continue to be ignored.

C Language Changes in Clang
---------------------------

- ...

...

C11 Feature Support
^^^^^^^^^^^^^^^^^^^

...

C++ Language Changes in Clang
-----------------------------

...

C++1z Feature Support
^^^^^^^^^^^^^^^^^^^^^

...

Objective-C Language Changes in Clang
-------------------------------------

...

OpenCL C Language Changes in Clang
----------------------------------

Clang now has support for all OpenCL 2.0 features.  In particular, the following
features have been completed since the previous release:

- Pipe builtin functions (s6.13.16.2-4).
- Address space conversion functions ``to_{global/local/private}``.
- ``nosvm`` attribute support.
- Improved diagnostic and generation of Clang Blocks used in OpenCL kernel code.
- ``opencl_unroll_hint`` pragma.

Several miscellaneous improvements have been made:

- Supported extensions are now part of the target representation to give correct
  diagnostics  for unsupported target features during compilation. For example,
  when compiling for a target that does not support the double precision
  floating point extension, Clang will give an error when encountering the
  ``cl_khr_fp64`` pragma. Several missing extensions were added covering up to
  and including OpenCL 2.0.
- Clang now comes with the OpenCL standard headers declaring builtin types and
  functions up to and including OpenCL 2.0 in ``lib/Headers/opencl-c.h``. By
  default, Clang will not include this header. It can be included either using
  the regular ``-I<path to header location>`` directive or (if the default one
  from installation is to be used) using the ``-finclude-default-header``
  frontend flag.

  Example:

  .. code-block:: none

    echo "bool is_wg_uniform(int i){return get_enqueued_local_size(i)==get_local_size(i);}" > test.cl
    clang -cc1 -finclude-default-header -cl-std=CL2.0 test.cl

  All builtin function declarations from OpenCL 2.0 will be automatically
  visible in test.cl.
- Image types have been improved with better diagnostics for access qualifiers.
  Images with one access qualifier type cannot be used in declarations for
  another type. Also qualifiers are now propagated from the frontend down to
  libraries and backends.
- Diagnostic improvements for OpenCL types, address spaces and vectors.
- Half type literal support has been added. For example, ``1.0h`` represents a
  floating point literal in half precision, i.e., the value ``0xH3C00``.
- The Clang driver now accepts OpenCL compiler options ``-cl-*`` (following the
  OpenCL Spec v1.1-1.2 s5.8). For example, the ``-cl-std=CL1.2`` option from the
  spec enables compilation for OpenCL 1.2, or ``-cl-mad-enable`` will enable
  fusing multiply-and-add operations.
- Clang now uses function metadata instead of module metadata to propagate
  information related to OpenCL kernels e.g. kernel argument information.

OpenMP Support in Clang
----------------------------------

...

Internal API Changes
--------------------

These are major API changes that have happened since the 3.8 release of
Clang. If upgrading an external codebase that uses Clang as a library,
this section should help get you past the largest hurdles of upgrading.

-  ...

AST Matchers
------------

...

libclang
--------

...

With the option --show-description, scan-build's list of defects will also
show the description of the defects.


Static Analyzer
---------------

The analyzer now checks for incorrect usage of MPI APIs in C and C++. This
check can be enabled by passing the following command to scan-build:
``-enable-checker optin.mpi.MPI-Checker.``

The analyzer now checks for improper instance cleanup up in Objective-C
``-dealloc`` methods under manual retain/release.

On Windows, checks for memory leaks, double frees, and use-after-free problems
are now enabled by default.

The analyzer now includes scan-build-py, an experimental reimplementation of
scan-build in Python that also creates compilation databases.

The scan-build tool now supports a ``--force-analyze-debug-code`` flag that
forces projects to analyze in debug mode. This flag leaves in assertions and so
typically results in fewer false positives.

Core Analysis Improvements
==========================

- ...

New Issues Found
================

- ...

Python Binding Changes
----------------------

The following methods have been added:

-  ...

Significant Known Problems
==========================

Additional Information
======================

A wide variety of additional information is available on the `Clang web
page <http://clang.llvm.org/>`_. The web page contains versions of the
API documentation which are up-to-date with the Subversion version of
the source code. You can access versions of these documents specific to
this release by going into the "``clang/docs/``" directory in the Clang
tree.

If you have any questions or comments about Clang, please feel free to
contact us via the `mailing
list <http://lists.llvm.org/mailman/listinfo/cfe-dev>`_.
