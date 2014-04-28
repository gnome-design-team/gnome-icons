#!/usr/bin/env ruby
require "rexml/document"
include REXML

INKSCAPE = "/usr/bin/inkscape"
TEMPLATE = "avatar.svg"
OUT = "avatar.png"
ABSPREFIX = Dir.pwd
TMP = "out.svg"

def render(image)
  templatexml = Document.new(File.new(TEMPLATE,'r'))
  #puts templatexml
  templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['xlink:href'] = image
  templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref'] = 
    "file://#{ABSPREFIX}/#{image}"
  #puts templatexml.root.elements["//pattern[@inkscape:label='avatarpattern']/image"].attributes['sodipodi:absref']
  tmp_f = File.new(TMP,'w+')
  tmp_f.puts templatexml
  tmp_f.close
  exec = "#{INKSCAPE} -e #{OUT} #{TMP}"
  system(exec)
  File.unlink(TMP)
end

if ARGV[0]
  render(ARGV[0])
else
  puts "Pass photo filename as a parameter"
end
