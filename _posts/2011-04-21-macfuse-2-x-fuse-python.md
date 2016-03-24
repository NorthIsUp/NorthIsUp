---
layout: post
title: "MacFUSE 2.x + fuse-python"
date: 2011-04-21
type: post
status: published
tags: Code, FUSE, git, Life, python, tl;dr
---


This took me a long while, so here is a step by step guide (and a TL;DR for people like me)


#### Install MacFUSE
I used the latest stable version [MacFUSE-2.0.3](http://code.google.com/p/macfuse/downloads/detail?name=MacFUSE-2.0.3,2.dmg) it is a standard OS X installer .pkg so it shouldn't give any problems on a clean system. I have, however, had a few problems installing it alongside homebrew since they both go into /usr/local. These problems were mainly due to a previously failed upgrade of MacFUSE.

#### Edit fuse.pc

The line we will be editing is this:

	Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64

And we will be adding this onto the end:

	Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64 -D__DARWIN_64_BIT_INO_T=0

And for completeness here is a diff of the two files:

	$ diff /usr/local/lib/pkgconfig/fuse.pc /usr/local/lib/pkgconfig/fuse.pc.orig
	10c10
	< Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64 -D__DARWIN_64_BIT_INO_T=0
	---
	> Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64

#### Install fuse-python and fail!

If you try to install fuse-python at this point it will fail, this is because something in Python.h depends on osreldate.h. You don't have osreldate.h.

	/usr/local/Cellar/python/2.7.1/include/python2.7/pyport.h:667:23: error: osreldate.h: No such file or directory

Note: I will be using pip to install fuse-python because it is awesome and easy, if you want easy_install should also work or by downloading from [here](http://pypi.python.org/pypi/fuse-python).

Proof of failure (abbreviated):

	$ pip install fuse-python
	Installing collected packages: fuse-python
	...
	/usr/local/Cellar/python/2.7.1/include/python2.7/pyport.h:667:23: error: osreldate.h: No such file or directory
	...
	error: command '/usr/bin/cc' failed with exit status 1

To fix this all you need to do is the following, but make sure you are touching osreldate.h at the right location. For my install of python 2.7.1 with homebrew it is here:

	$ touch /usr/local/Cellar/python/2.7.1/include/python2.7/osreldate.h

#### Install fuse-python and win

	$ pip install fuse-python
	Downloading/unpacking fuse-python
	Running setup.py egg_info for package fuse-python

	Installing collected packages: fuse-python
	Found existing installation: fuse-python 0.2
	Uninstalling fuse-python:
	Successfully uninstalled fuse-python
	Running setup.py install for fuse-python
	building 'fuseparts._fusemodule' extension
	/usr/bin/cc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I/opt/local/include -D_FILE_OFFSET_BITS=64 -I/usr/local/include/fuse -I/usr/local/Cellar/python/2.7.1/include/python2.7 -c fuseparts/_fusemodule.c -o build/temp.macosx-10.5-intel-2.7/fuseparts/_fusemodule.o -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64 -D__DARWIN_64_BIT_INO_T=0
	In file included from /usr/local/Cellar/python/2.7.1/include/python2.7/Python.h:126,
	from fuseparts/_fusemodule.c:35:
	/usr/local/Cellar/python/2.7.1/include/python2.7/modsupport.h:27: warning: 'PyArg_ParseTuple' is an unrecognized format function type
	fuseparts/_fusemodule.c: In function 'Fuse_main':
	fuseparts/_fusemodule.c:987: warning: assignment from incompatible pointer type
	fuseparts/_fusemodule.c:989: warning: assignment from incompatible pointer type
	/usr/bin/cc -arch i386 -arch x86_64 -isysroot / -L/usr/local/Cellar/readline/6.1/lib -bundle -undefined dynamic_lookup -arch i386 -arch x86_64 -isysroot / -L/usr/local/Cellar/readline/6.1/lib -I/opt/local/include -D_FILE_OFFSET_BITS=64 build/temp.macosx-10.5-intel-2.7/fuseparts/_fusemodule.o -L/usr/local/lib -lfuse -liconv -o build/lib.macosx-10.5-intel-2.7/fuseparts/_fusemodule.so
	ld: warning: in build/temp.macosx-10.5-intel-2.7/fuseparts/_fusemodule.o, file is not of required architecture

Successfully installed fuse-python
Cleaning up…

You can now run the examples now to test your system!

#### TL;DR:

Make /usr/local/lib/pkgconf/fuse.pc look like this (you want the top line):

	$ diff /usr/local/lib/pkgconfig/fuse.pc /usr/local/lib/pkgconfig/fuse.pc.orig
	10c10
	< Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64 -D__DARWIN_64_BIT_INO_T=0
	---
	> Cflags: -I${includedir}/fuse -D__FreeBSD__=10 -D_FILE_OFFSET_BITS=64

Do this, but in the right place for your python install:

	$ touch /usr/local/Cellar/python/2.7.1/include/python2.7/osreldate.h

Install via pip

	$ pip install fuse-python
