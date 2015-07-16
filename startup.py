# -*- coding: utf-8 -*-

"""
Python startup script. 

Include in your .zshrc (or equivalent): 

    export PYTHONSTARTUP=/path/to/this/file/startup.py

"""

import os 
import sys
import numpy as np
import pandas as pd
 
from datetime import datetime

def print_line():
    print "*"*10

print  
print_line()
print "python", repr(sys.version)
print "numpy", np.__version__
print "pandas", pd.__version__

try:
    import django
    print "django", django.__version__
except ImportError:
    print "Django not available"

print_line()
