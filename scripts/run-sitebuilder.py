#! /usr/bin/env python
#

from subprocess import call
import os

sitePath = os.path.normpath(os.path.dirname((os.path.join(os.getcwd(),os.path.dirname(__file__) ) ) ) )
siteDir = os.path.join(sitePath,"www")

# Copy Notebooks to the user space (leaving originals unchanged)
# Make symlinks for Data and Documentation so that these are visible
# to the web server started in the www build directory

print "Building {:s}".format(siteDir)

call("cd {:s} && mkdocs build --clean".format(sitePath), shell=True)
call("ln -s {:s}/Data/ {:s}".format(sitePath, siteDir), shell=True)
call("ln -s {:s}/Documentation/ {:s}".format(sitePath, siteDir), shell=True)
call("cp -r {:s}/Notebooks/ {:s}/Notebooks".format(sitePath,siteDir), shell=True)
