---
layout: post
title: "The ternary operator in Python"
date: 2009-07-13
type: post
status: published
tags: Code, python, Technology, ternary
---



The ternary operator of C is one of my favorite operators, it may be hard to read at times, but oh so useful.

{% highlight c %}
    (a ? b : c)
{% endhighlight %}

In python you can do this in three ways, the third way is only available in python 2.5 and up. It is essentially a ternary operator and doesn’t require any complicated hacks. In these lambda function examples I am using a as the conditional, b as the true option and c as the false option:


{% highlight python %}
    (a and [b] or [c])[0]
{% endhighlight %}

This works due to the particular nature of and and or. The article is very good and goes in depth into the nature of and and or, specifically as to why this works. The reason that b and c are in brackets is because in some cases the b value can return False, but a list will always return True. Since we are returning a list we must reference the first element.


{% highlight python %}
    (b,c)[not a]
{% endhighlight %}

In this instance we rely on the fact that True == 1 and False == 0. This is important because we are using a conditional to access an element of the tuple. If a is True then not a will be false, or 0, thus accessing the first element. Similarly if a is False then not a will be True, or 1, and this will access the second element.


{% highlight python %}
    b if a else c
{% endhighlight %}

This simply returns b if a is true and c otherwise. Very self explanatory.

Here is an example of each form in action:

{% highlight python %}
    twoleg = ["human", "kangaroo"]
    fourleg = ["dog", "elephant"]
    animals = ["human", "kangaroo", "dog", "elephant"]

    print("\nMethod one:")
    for c in animals:
    print "%s has %s legs"%(c, (c in twoleg and ["two"] or ["four"])[0])

    print("\nMethod two:")
    for c in animals:
    print "%s has %s legs"%(c, ("two", "four")[c not in twoleg])

    print("\nPython 2.5+ only:")
    for c in animals:
    print "%s has %s legs"%(c, "two" if c in twoleg else "four")
{% endhighlight %}

