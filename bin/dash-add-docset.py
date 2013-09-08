#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import sys
import urllib

regex = re.compile(
    r'^(?:http|ftp)s?://'  # http:// or https://
    r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)'
    '+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|'  # domain
    r'localhost|'  # localhost...
    r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})'  # ...or ip
    r'(?::\d+)?'  # optional port
    r'(?:/?|[/?]\S+)$', re.IGNORECASE)

if len(sys.argv) != 2 or not regex.match(sys.argv[1]):
    print "%s requires a valid URL parameter." % sys.argv[0]
    sys.exit(1)
else:
    os.system('open dash-feed://%s' % urllib.quote(sys.argv[1], ''))
    sys.exit(0)
