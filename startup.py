# -*- coding: utf-8 -*-

"""
Python startup script. 

Include in your .zshrc (or equivalent): 

    export PYTHONSTARTUP=/path/to/this/file/startup.py

"""

import sys
 
def print_line():
    print "*"*10

print  
print_line()
print "python", repr(sys.version)

try:
    import numpy as np
    print "numpy", np.__version__
except ImportError:
    print "numpy not available"

try:
    import pandas as pd
    print "pandas", pd.__version__
except ImportError:
    print "pandas not available"

try:
    import django
    print "django", django.__version__
except ImportError:
    print "Django not available"

print_line()
