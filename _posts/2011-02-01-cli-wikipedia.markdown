--- 
layout: post
title: cli wikipedia
published: true
meta: 
  aktt_notify_twitter: "yes"
  quote-url: http://
  _edit_last: "2"
  aktt_tweeted: "1"
  quote-copy: Unknown
  image: ""
  link-url: http://
  quote-author: Unknown
tags: 
- Life
- protip
type: post
status: publish
---
I just learned that via the dig command you can get the first paragraph of wikipedia articles.

	dig +short txt [article name].wp.dg.cx

The article name must be wiki formatted, so that means underscores for spaces. To make this easier I did a simple sed command:

	echo $@ | sed -e 's/ /_/g'

So Add this to your .profile (or wherever you put your functions) to get a cli wiki program:

	wiki() { dig +short txt `echo $@ | sed -e 's/ /_/g'`.wp.dg.cx | fmt }
