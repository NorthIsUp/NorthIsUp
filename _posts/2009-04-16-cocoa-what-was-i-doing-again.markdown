--- 
layout: post
title: "Cocoa: What was I doing again?"
published: true
meta: {}

tags: 
- Life
type: post
status: publish
---
It is very easy to loose context of what is going on in your debug output. I like the following: 
    
    NSLog(@"%@ received %@", self, NSStringFromSelector(_cmd));
