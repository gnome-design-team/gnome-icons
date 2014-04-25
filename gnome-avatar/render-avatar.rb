#!/usr/bin/env ruby
require "rexml/document"
include REXML

TEMPLATE = "avatar.svg"

if ARGV[0]
  render(ARGV[0])
else
  puts "Need a bitmap parameter"
end

def render(image)
  puts image
end

#template.root.elements["//pattern[@inkscape:label='avatar']/image"].attributes['xlink:href'] = 
#  ABSPREFIX + self.background
#template.root.elements["//pattern[@inkscape:label='avatar']/image"].attributes['sodipodi:absref'] = 
#  ABSPREFIX + self.background
#template.root.elements["//image[@inkscape:label='logo']"].attributes['xlink:href'] = LOGO
#template.root.elements["//image[@inkscape:label='logo']"].attributes['sodipodi:absref'] = LOGO
