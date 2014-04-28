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
  #tmp_f = File.new(TMP,'w+')
  #tmp_f.puts templatexml
  #tmp_f.close
  exec = "#{INKSCAPE} -e #{OUT} #{TMP}"
  os.system(exec)
  #File.unlink(TMP)


if sys.argv[0]:
  render(sys.argv[0])
else:
  print("`./render-avatar.rb photo.jpg`\n\nPass a square photo filename as a parameter.")

