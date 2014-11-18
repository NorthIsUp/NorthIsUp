#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os
root = os.path.abspath(os.path.dirname(__file__))

AUTHOR = u'adam hitchcock'
SITENAME = u'NorthIsUp'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

## URLS ########################################################################
ARTICLE_URL = 'blog/{slug}/'
ARTICLE_SAVE_AS = 'blog/{slug}/index.html'
PAGE_URL = 'pages/{slug}/'
PAGE_SAVE_AS = 'pages/{slug}/index.html'


# Blogroll
# LINKS = (('Pelican', 'http://getpelican.com/'),
#          ('Python.org', 'http://python.org/'),
#          ('Jinja2', 'http://jinja.pocoo.org/'),
# ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('disqus', 'http://disqus.com/NorthIsUp/'),
          ('twitter', 'http://twitter.com/NorthIsUp/'),)

DEFAULT_PAGINATION = False

THEME = root + "/pelican-themes/svbtle"
print THEME

## PLUGINS #####################################################################
PLUGIN_PATHS = [root + '/pelican-plugins']
PLUGINS = []

# gravatar
PLUGINS += ['gravatar']

# disqus
# PLUGINS += ['disqus_static']
DISQUS_SITENAME = 'northisup'
# DISQUS_SECRET_KEY = u'AdkNJNoUrP1qgB3cNNd50s0ZlccG96UtOODu0qKdV7yrw1P5XXHALJAnmx7i9Cio'
# DISQUS_PUBLIC_KEY = u'AV3s9z8WEPHfP3WoTwuoPVntjBZ55BIsMF4B0MSkkm3WW88ijwJ9x7lAy3bbFs5F'

AUTHOR_EMAIL = 'adam@northisup.com'


# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
