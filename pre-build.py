#/usr/bin/python

"""
  This script is designed as a pre-build step for iOS Xcode projects. To use it, do the following:
  1. Create a new pre-build step
  2. Set the Shell field to "/usr/bin/python"
  3. Select your target in "Provide build settings from"
  4. Copy everything below the hash line into the input box

  This script should be accompanied by the post-build step in post-build.py
"""
###############################################
import os
import datetime
from Cocoa import NSMutableDictionary
plistPath = "%(s)s/%(n)s/%(n)s-Info.plist" % {'s': os.getenv('SRCROOT'), 'n': os.getenv('PRODUCT_NAME')}
info = NSMutableDictionary.dictionaryWithContentsOfFile_(plistPath)
now = datetime.datetime.now()
bundleVersion = "%.4d%.2d%.2d.%.2d%.2d" % (now.year, now.month, now.day, now.hour, now.minute)
info['CFBundleVersion'] = bundleVersion
os.rename(plistPath, "%s.temp" % plistPath)
info.writeToFile_atomically_(plistPath, True)

