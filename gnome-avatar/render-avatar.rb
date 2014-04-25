#!/usr/bin/env ruby
require "rexml/document"
include REXML

INKSCAPE = "/usr/bin/inkscape"
TEMPLATE = "avatar.svg"
OUT = "avatar.png"
ABSPREFIX = Dir.pwd

def render(image)
  templatexml = Document.new(File.new(TEMPLATE,'r'))
  #puts templatexml
  templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['xlink:href'] = image
  templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref'] = 
    "file://#{ABSPREFIX}/#{image}"
  puts templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref']
  exec = "#{INKSCAPE} -e #{OUT} #{TEMPLATE}"
  system(exec)
end

if ARGV[0]
  render(ARGV[0])
else
  puts "Need a bitmap parameter"
end



#
#  ABSPREFIX + self.background
#template.root.elements["//pattern[@inkscape:label='avatar']/image"].attributes['sodipodi:absref'] = 
#  ABSPREFIX + self.background
#template.root.elements["//image[@inkscape:label='logo']"].attributes['xlink:href'] = LOGO
#template.root.elements["//image[@inkscape:label='logo']"].attributes['sodipodi:absref'] = LOGO
