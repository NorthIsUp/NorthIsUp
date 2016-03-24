---
layout: page
title: "OS X Blessings"
date: 2009-12-25
type: post
status: published
tags: Life
---


Just found out about `bless`.

It is a command that allows you to modify aspects of the filesystem. Like flag a volume as bootable. One nifty option is `--openfolder`.

From the manpage:

    --openfolder directory Specify a folder to be opened in the Finder when the volume is mounted by the system.

So I first tried changing the current setting to another existing folder

    sudo bless --folder "/Volumes/Douglas" --openfolder "/Volumes/Douglas/var"

After unmounting and remounting the volume, the Finder automatically displayed the var folder this time. You can't specify a nonexistent folder, so I went ahead and created dummy inside of tmp on the Install DVD partition, and then issued this command:

    sudo bless --folder "/Volumes/Douglas" --openfolder "/Volumes/Douglas/tmp/dummy"
