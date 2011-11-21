--- 
layout: post
title: Cell Phones as clients for pervasive computing
published: true
meta: 
  btc_comment_summary: a:0:{}
  _edit_last: "2"
  btc_comment_counts: a:0:{}
tags: 
- Life
- Mobile Computing
- Research
- School
- Technology
type: post
status: publish
---
I have believed for a number of years now that the convergence device for computing is the cell phone. The phone is the perfect convergence device because everybody already has one, they carry it around with them, and they get a new one every two years. Now it may be a long while before phones actually replace conventional computers (if they ever do). But it will not be long before they will be able to do most of the things we want out of our home computers. The iPhone is an excellent example of a small device that is powerful enough to do such tasks. It can check my e-mail and browse the web (and I mean the real web, not the 'mobile web' which is severely crippled). The iPhone is, unfortunately, not a typical phone it is a super phone. A more typical phone is the RAZR from Motorolla. It is popular, small, and most importantly for this research has bluetooth capabilities. So for our project we will look at more commonplace phones. The only assumption we make is that the phone has bluetooth. Specifically we are looking at how to use a centralized server and the internet to collect presence information from bluetooth enabled phones. When a computer detects a nearby bluetooth device it will send its id to the server, the server then record the location of the device and send the computer a variety of information. Here are two examples of use: **1)** Suppose I have a 9:00 meeting that has been changed to 8:30, and suppose its a large meeting (like a shareholders meeting) so it is not practical or possible to call everybody in attendance. The new time could be posted in vCal format to the server and as soon as I walk by a computer with bluetooth that computer would tell the server I just walked by and the server would respond with the vCal information. This could then be pushed to the phone using bluetooth's OBEX protocol. My phone would beep and I would know the new meeting time. **2)** Suppose a network of computers in an office, often it is useful to know about the network topology of the office, but what about the physical topology? If every computer comes equipped with bluetooth then we can use this system to have each computer detect its neighbors and we can make some assumptions about the physical topology. After the framework is built there are many areas of interest: 

> * What is the most efficient way to detect phones?
> * What about devices that aren't mobile? ie. two desktops which continually report back to the server that they are next to each other, is this useful?
> * If computer A detects B but B does not detect A what does that mean?
> * How do you resolve conflicts when two computers can both detect the same phone?
> * Is this limited to only phones? clearly not! so what are other applications?
> * How do you ensure security? privacy? anonymity?
> * How do you handle devices with partial support for bluetooth?
> * We assume that phones are only receivers in this scheme, can a phone initiate contact?
> * What if we could put programs on the phones? Could we hook them into sensor networks?
> * If phones can push data to the server could this be used to track medical conditions? environmental conditions? safety conditions?
