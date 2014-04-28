#!/usr/bin/env python3
import xml.etree.ElementTree as etree
import os, sys

INKSCAPE = "/usr/bin/inkscape"
TEMPLATE = "avatar.svg"
OUT = "avatar.png"
ABSPREFIX = os.getcwd()
TMP = "out.svg"

def render(image):
  templatexml = etree.parse(TEMPLATE)
  #puts templatexml
  #templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['xlink:href'] = image
  #templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref'] = 
  #  "file://#{ABSPREFIX}/#{image}"
  #puts templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref']
  templatexml.write(TMP, encoding="utf-8")
  exec = "%s -e %s %s" % (INKSCAPE, OUT, TMP)
  print(exec)
  os.system(exec)
  #File.unlink(TMP)

print(sys.argv)
if len(sys.argv)>1:
  render(sys.argv[1])
else:
  print("`./render-avatar.rb photo.jpg`\n\nPass a square photo filename as a parameter.")

