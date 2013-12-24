title: Cocoa: What was I doing again?
type: post
status: published
tags: Life


It is very easy to loose context of what is going on in your debug output. I like the following: 
    
    NSLog(@"%@ received %@", self, NSStringFromSelector(_cmd));
