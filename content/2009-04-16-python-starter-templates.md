title: Python starter templates
type: post
status: published
tags: Code


Over the past few months I have developed several patterns in the tools that I develop. 1) I like command line options. 2) I like to be able to run other command line programs and parse the output Code after the break. 
    
    
    #!/usr/bin/env python
    # encoding: utf-8
    """
    ${TM_NEW_FILE_BASENAME}.py
    
    Created by ${TM_FULLNAME} on ${TM_DATE}.
    Copyright (c) ${TM_YEAR} ${TM_ORGANIZATION_NAME}. All rights reserved.
    """
    
    import os
    import sys
    import getopt
    import subprocess
    
    
    help_message = '''
    The help message goes here.
    '''
    
    
    class Usage(Exception):
        def __init__(self, msg):
            self.msg = msg
    
    
    def main(argv=None):
        if argv is None:
            argv = sys.argv
        try:
            try:
                opts, args = getopt.getopt(argv[1:], "ho:v", ["help", "output="])
            except getopt.error, msg:
                raise Usage(msg)
    
            # option processing
            for option, value in opts:
                if option == "-v":
                    verbose = True
                if option in ("-h", "--help"):
                    raise Usage(help_message)
                if option in ("-o", "--output"):
                    output = value
    
        except Usage, err:
            print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
            print >> sys.stderr, "\t for help use --help"
            return 2
    
        def renext(next):
            print next
    
        def main():
            popenargs = []
            result = subprocess.Popen(popenargs, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            while 1:
                print dir(result)
                next = result.stdout.readline()
                if not next:
                    break
                else:
                    print next
    
    if __name__ == "__main__":
        sys.exit(main())
    
