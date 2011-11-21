--- 
layout: post
title: The ternary operator in Python
published: true
meta: 
  aktt_notify_twitter: "yes"
  _edit_last: "2"
  aktt_tweeted: "1"
  btc_comment_counts: a:0:{}
tags: 
- Code
- python
- Technology
- ternary
type: post
status: publish
---
The ternary operator of C is one of my favorite operators, it may be hard to read at times, but oh so useful. [c] (a ? b : c) [/c] In python you can do this in three ways, the third way is only available in python 2.5 and up. It is essentially a ternary operator and doesn't require any complicated hacks. In these lambda function examples I am using **a** as the conditional, **b** as the true option and **c** as the false option: [python] q=lambda a,b,c: (a and [b] or [c])[0] [/python] This works due to the [particular nature of and and or](http://www.diveintopython.org/power_of_introspection/and_or.html). The article is very good and goes in depth into the nature of and and or, specifically as to why this works. The reason that **b** and **c** are in brackets is because in some cases the **b** value can return False, but a list will always return True. Since we are returning a list we must reference the first element. [python] q=lambda a,b,c: (b,c)[not a] [/python] In this instance we rely on the fact that `True == 1` and `False == 0`. This is important because we are using a conditional to access an element of the tuple. If a is True then not a will be false, or 0, thus accessing the first element. Similarly if a is False then not a will be True, or 1, and this will access the second element. [python] q=lambda a,b,c: b if a else c [/python] This simply returns b if a is true and c otherwise. Very self explanatory. Here is an example of each form in action: [python] twoleg = ["human", "kangaroo"] fourleg = ["dog", "elephant"] animals = ["human", "kangaroo", "dog", "elephant"] print("\nMethod one:") for c in animals: print "%s has %s legs"%(c, (c in twoleg and ["two"] or ["four"])[0]) print("\nMethod two:") for c in animals: print "%s has %s legs"%(c, ("two", "four")[c not in twoleg]) print("\nPython 2.5+ only:") for c in animals: print "%s has %s legs"%(c, "two" if c in twoleg else "four") [/python] 
