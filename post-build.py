#/usr/bin/python

"""
  This script is designed as a post-build step for iOS Xcode projects. To use it, do the following:
  1. Create a new post-build step
  2. Set the Shell field to "/usr/bin/python"
  3. Select your target in "Provide build settings from"
  4. Copy everything below the hash line into the input box

  This script should be accompanied by the pre-build step in pre-build.py
"""
###############################################
import os
plistPath = "%(s)s/%(n)s/%(n)s-Info.plist" % {'s': os.getenv('SRCROOT'), 'n': os.getenv('PRODUCT_NAME')}
os.rename("%s.temp" % plistPath, plistPath)

