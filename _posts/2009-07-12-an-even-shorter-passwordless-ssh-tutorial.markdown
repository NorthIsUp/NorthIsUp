--- 
layout: post
title: An even shorter passwordless ssh tutorial
published: true
meta: 
  code_editor: ""
  aktt_notify_twitter: "yes"
  code_type: Xml
  _edit_last: "2"
  aktt_tweeted: "1"
  btc_comment_counts: a:0:{}
tags: 
- Code
- SSH
- Technology
type: post
status: publish
---
My favorite passwordless ssh tutorial went offline, so here is my rehash of it. Your server names will, of course, vary. Localhost is the machine you are currently on and, in my case, northisup.com is the server I'm SSHing into. [code] localhost$ ssh-keygen -t dsa localhost$ cat ~/.ssh/id_dsa.pub | \ ssh northisup.com 'cat >> ~/.ssh/authorized_keys; \ chmod 644 ~/.ssh/authorized_keys; \ cat ~/.ssh/authorized_keys' localhost$ ssh username@northisup.com [/code] If you are prompted for a password it should be the password entered in the first step. This part: [code]chmod 644 ~/.ssh/authorized_keys[/code] is the most common cause of problems, ssh requires authorized_keys not be group writable. Permissions are also important for the home directory on the server. Now **at this point you may be done**, but if it is still asking for your key password (you will know because the password dialog is different from the standard ssh dialog) then you will have to set up an ssh-agent. I haven't had to setup an ssh-agent in years; this is because many modern OSs like OS X and recent versions of Ubuntu have keychains that have properties indistinguishable from magic. [code] localhost$ ssh-agent code localhost$ ssh-add ~/.ssh/id_dsa localhost$ ssh username@northisup.com [/code] This is effective only for your _current_ shell. So if you open up a second instance of xterm you'll have to do it again. Further more it doesn't allow cron or other scripts, which frequently run in their own shell instances, to use passwordless ssh. To solve this we want to add the agent initalization to our .coderc file. Edit ~/.bashrc and add the following at the end: [code] ssh_agent="$HOME/.ssh-agent.sh" if [ -f $ssh_agent ] ; then source $ssh_agent > /dev/null fi [/code] Note that I pipe the output to /dev/null to stop the agent pid being echo'd which can break the pipe of some commands (sftp, for instance). [code] localhost$ ssh-agent > ~/.ssh-agent.sh [/code] Either exit the shell and start a new one or [code] localhost$ source ~/.ssh_agent.sh localhost$ ssh-add ~/.ssh/id_dsa localhost$ ssh username@northisup.com [/code] This time there should be no password! While ssh-agent is running all your processes (including your cron jobs) shouldn't need a password. However if ssh-agent dies or is killed things might go wrong since the old settings are left over. 
