---
layout: post
title: "Google visualization from python"
date: 2009-05-05
type: post
status: published
tags: api, Code, Google, Life, python, Technology, Web 2.0
---


So I was hacking away at a turbogears project and thought 'how cool would it be to visualize this?' That thought lead to a short example of how to get the graphing visualization from google finance into your app. I used cherrypy to do the web serving for the example. Code after the break (sorry if wordpress formats it poorly).

    #!/usr/bin/env python
    # encoding: utf-8
    """
    chart_example.py

    Dynamic example of chart visualization

    Created by Adam Hitchcock on 2009-05-05.
    Copyright (c) 2009 __NorthIsUp__. All rights reserved.
    """

    import sys
    import os
    import string
    import subprocess
    import cherrypy

    body = """

    """

    class DataTable():
    	def __init__(self):
    		"""columns [{'name':'aname', 'type':'JStype'}]"""

    		self.columns = []
    		self.values = []
    		pass

    	def render(self):
    		s = """




    """
    		return s + body

    	def add_column(self, name, jstype):
    		self.columns.append({'name':name, 'jstype':jstype})

    	def add_value(self, row, column, value):
    		"""docstring for add_value"""
    		self.values.append({'row':row, 'column':column, 'value':value})

    class chart_example(object):

    	def index(self):
    		d = DataTable()
    		columns = [
    		{'jstype':'date',	'name':'Date'},
    		{'jstype':'number', 'name':'Sold Pencils'},
    		{'jstype':'string', 'name':'title1'},
    		{'jstype':'string', 'name':'text1'},
    		{'jstype':'number', 'name':'Sold Pens'},
    		{'jstype':'string', 'name':'title2'},
    		{'jstype':'string', 'name':'text2'},
    		]

    		values = [
    		[{'column':0, 'value':"new Date(2008, 1 ,1)"},
    		{'column':1, 'value':"30000"},
    		{'column':4, 'value':"40645"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,2)"},
    		{'column':1, 'value':"14045"},
    		{'column':4, 'value':"20374"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,3)"},
    		{'column':1, 'value':"55022"},
    		{'column':4, 'value':"50766"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,4)"},
    		{'column':1, 'value':"75284"},
    		{'column':4, 'value':"14334"},
    		{'column':5, 'value':"'Out of Stock'"},
    		{'column':6, 'value':"'Ran out of stock on pens at 4pm'"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,5)"},
    		{'column':1, 'value':"41476"},
    		{'column':2, 'value':"'Bought Pens'"},
    		{'column':3, 'value':"'Bought 200k pens'"},
    		{'column':4, 'value':"66467"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,6)"},
    		{'column':1, 'value':"33322"},
    		{'column':4, 'value':"39463"},
    		{'column':2, 'value':"'Bought Pens2'"},
    		{'column':3, 'value':"'Bought 200k pens2'"},
    		{'column':4, 'value':"66467"},],

    		[{'column':0, 'value':"new Date(2008, 1 ,7)"},
    		{'column':1, 'value':"33322"},
    		{'column':4, 'value':"39463"}]
    		,]

    		for c in columns:
    			d.add_column(c['name'], c['jstype'])

    		for vals, i in zip(values, range(len(values))):
    			for v in vals:
    				d.add_value(i, v['column'], v['value'])
    		return d.render()
    	index.exposed = True

    class sub_wrapper(object):
    	def renext(self, next):
    		print next

    	def doit(self, popenargs):
    		result = subprocess.Popen(popenargs, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    		return result

    cherrypy.config.update({'server.socket_host': '127.0.0.1', 'server.socket_port': 8080, })
    cherrypy.quickstart(chart_example())
