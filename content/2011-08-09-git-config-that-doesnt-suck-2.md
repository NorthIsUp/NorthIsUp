title: Git config that doesn't suck.
type: post
status: published
tags: Code


```git
	[user]
	name = Adam Hitchcock
	email = adam.hitchcock@skype.net

	[color]
	status = auto
	branch = auto
	diff = auto
	ui = auto

	[color "branch"]
	current = yellow reverse
	local = yellow
	remote = green

	[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
	whitespace = red reverse

	[color "status"]
	added = yellow
	changed = green
	untracked = cyan

	[merge]
	tool = opendiff

	[core]
	excludesfile = /Users/north/.gitignore
	whitespace=fix,tab-in-indent,trailing-space,cr-at-eol
	autocrlf = input
	safecrlf = warn
	#editor = mate -w

	[alias]
	log = log --graph
	logp = log -p --graph
	logs = log --stat --graph
	what = whatchanged
	mom = merge origin/master
	stat = status
	st = status
	ci = commit
	co = checkout
	br = branch
	ft = svn fetch
	up = svn rebase
	dco = svn dcommit
	df = diff
	lg = log --pretty=oneline --all --graph --abbrev-commit --decorate
	ll = log --raw
	lo = log --pretty=oneline --graph
	fa = fetch --all
	rl = rev-list --pretty=oneline --all --graph --abbrev-commit -n 100
	#open a github url for the current git repo
	hub = !git remote -v|sed "'s|.*git
	[:@]\\(.*\\).git.*|http://\\1|;s|m:|m/|'"|uniq|xargs open
	chop = !zsh -c "CB=$(git branch | grep '\\*') && CB=${CB
	[3,-1]} && [ $CB != \"(no branch)\" ] && git checkout --detach ${1:-\"HEAD\"} && git branch -d ${CB}"
```
