---
layout: post
title: "cli wikipedia"
date: 2011-02-01
type: post
status: published
tags: Life, protip
---


I just learned that via the dig command you can get the first paragraph of wikipedia articles.

	dig +short txt [article name].wp.dg.cx

The article name must be wiki formatted, so that means underscores for spaces. To make this easier I did a simple sed command:

	echo $@ | sed -e 's/ /_/g'

So Add this to your .profile (or wherever you put your functions) to get a cli wiki program:

	wiki() { dig +short txt `echo $@ | sed -e 's/ /_/g'`.wp.dg.cx | fmt }
