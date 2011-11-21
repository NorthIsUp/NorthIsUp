--- 
layout: post
title: Vim tricks for %s and ^M
published: true
meta: 
  aktt_notify_twitter: "yes"
  _edit_last: "2"
  aktt_tweeted: "1"
  btc_comment_counts: a:0:{}
tags: 
- Life
type: post
status: publish
---
Windows and, well everybody else, treat en-lines differently. When editing a Windows file under an editor such as vim at the end of each line a ctrl+m character is visibly displayed at the as ^M. To remove the ^M characters at the end of all lines in vi, do this: [bash] :%s/^V^M//g [/bash] The ^v and ^m characters are entered by typing the ctrl+v or ctrl+m respectively. When done correctly you should see this: [bash] :%s/^M//g [/bash] In UNIX, you can escape a control character by preceding it with a ctrl+v. The :%s is a basic search and replace command in vi. It tells vi to replace the regular expression between the first and second slashes (^M) with the text between the second and third slashes (nothing in this case). The g at the end directs vi to search and replace globally (all occurrences). Another vim trick. If you want to do a search/replace on a path, say you have /home/north and want to replace it with /Users/adam the / character has to get escaped a lot. The reason for this is that / is both the path delimiter and the search/replace delimiter. To make things easier vim lets you use any character you want for the search/replace delimiter. So this: [bash] :%s/\/home\/north/\/Users\/adam/g [/bash] Becomes this: [bash] :%s@/home/north@/Users/adam@g [/bash] Much nicer! 
