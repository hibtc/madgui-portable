"""
This module is imported automatically on python startup if reachable via
PYTHONPATH. On import it adds the './site-packages' subdirectory to the
list of site-directories. This will make the packages therein importable.
"""

import os
import site
import sys

this_dir = os.path.dirname(__file__)
site.addsitedir(os.path.join(this_dir, '32', 'python2.7'))
site.addsitedir(os.path.join(this_dir, '..', 'src'))

# sys.path.append(os.path.join(this_dir, '32', 'python2.7'))