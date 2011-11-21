--- 
layout: post
title: Want a real Dock separator for Leopard?
published: true
meta: 
  btc_comment_summary: a:0:{}
  _edit_last: "2"
  btc_comment_counts: a:0:{}
tags: 
- Apple
- Code
- Life
- OS X
type: post
status: publish
---
Type the following into a terminal: `$defaults write com.apple.dock persistent-apps -array-add '{ "tile-type" = "spacer-tile"; } $killall Dock ` Theseparatorwill appear next to the lastpermanentapplicationin your dock. Drag them around to where you want them! Run it again for another separator. To get rid of a separator right click it and select "Remove from Dock." 
