#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os
root = os.path.abspath(os.path.dirname(__file__))

AUTHOR = u'adam'
SITENAME = u'NorthIsUp'
SITEURL = ''

TIMEZONE = 'America/San Francisco'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Blogroll

# Social widget
SOCIAL = (('disqus', 'http://disqus.com/NorthIsUp/'),
          ('twitter', 'http://twitter.com/NorthIsUp/'),)

LINKS = SOCIAL

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

THEME = root + "/pelican-themes/svbtle"
print THEME

PLUGIN_PATH = root + '/pelican-plugins'
PLUGINS = ['gravatar', 'disqus']

AUTHOR_EMAIL = 'adam@northisup.com'
