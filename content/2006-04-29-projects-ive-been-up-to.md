title: Projects I've been up to
type: post
status: published
tags: Code, Life, School


**Operating Systems**  
In my OS class we did more than most universities; we wrote our own operating system almost entirely from scratch. We used the [Geek OS](//geekos.sourceforge.net/") project which was quite an experience, as it is in the early stages of development itself (and not _quite_ ready for educational use). When we did this project Geek OS was not very well documented so we, as new OS hackers, had quite an adventure exploring how exactly to complete each of the five projects.

The first project was simply to get user processes running in the user memory space. This involved researching the ELF header format and Intel documentation in great depth to determine exactly how to load a binary from disk into memory. Once in memory an inefficient Round-Robin scheduler would schedule processes and threads.

In project two we had to create a scheduling algorithm that would do better than FIFO or Round-Robin. We ended up using a Multi-Level Feedback Queue with four tiers that worked quite well.  
In project three we implemented virtual memory so a process could have up to 4GB memory outside of the ~64KB we were emulating.

For project four we implemented a virtual file system that could work with both FAT and the filesystem we created called GOSFS.

For our fifth and final project we used our semaphores and virtual memory to create a shared memory region between (up to 16) processes. This project was especially interesting as it accompanied my studies in High Performance Computing where we were looking at SMP systems and other shared memory systems.

This class, along with High Performance Computing, ignited my interest in systems, which is what I am now looking at grad schools for.

I have put my OS projects in the [downloads](http://infimp.net/AdamHitchcock/download.php) section for the time being. It will be taken down when the school year begins as it contains the solutions for GeekOS projects. If you wish to see it (and I have taken it down) e-mail me and I'll send it to you (if you are not a student).

**High Performance Computing**  
In HPC we studied many kinds of multi processor systems and the strengths/weakness of each one with projects accompanying each kind of system. We covered using homogeneous and heterogeneous MPI systems using computer labs at my school as a multi processor system as well as machines at the Ohio Supercomputer Center that use a shared memory architecture. We studied the difference in performance between using MPI on our own lab, our 16 node Gigabit Beowulf cluster, and the clusters at OSC.

Our projects included integration of a curve using MPI, solving the n-body problem on MPI and OpenMP, and implementing various parallel image processing on OpenMP.

For our final project my group chose to generate _large_ prime numbers using MPI and OpenMP. We originally planned to use a lab of Macintoshes with dual 1.25 G4 processors so we could use OpenMP on each machine as well as the AltiVec instruction set on each machine, then use MPI between all the machines. Unfortunately the generation of prime numbers lends itself best to OpenMP on a shared memory system, so we ended up using the 32 processor SGI Altix at OSC.

I have put my HPC projects in the [downloads](http://infimp.net/AdamHitchcock/download.php) section.

**Databases**  
In my databases class we spent the first few weeks solely on database theory, then we started on simple database projects. Ultimately each of us had to make a creative database (of sufficient complexity) that could be deployed in an enterprise scale. Whether or not any of us made "enterprise strength" databases I don't know, but some of them were really cool.

Mine was called "A Novel Idea" and was a system for students to get better prices when selling textbooks at the end of the year by selling the to other students instead of the book store. It included a web interface using cgi scripts.

I have put my Database project in the [downloads](http://infimp.net/AdamHitchcock/download.php) section.

**Computer System Architecture**  
This class focused on how a computer works at a hardware level. We studied the pipeline within a processor and how to exploit it in assembly code. Our semester long project was to implement the entire IEEE floating point library in RISC assembly on an IRIX 64 bit workstation.

I have put my IEEE floating point project in the [downloads](http://infimp.net/AdamHitchcock/download.php) section.
