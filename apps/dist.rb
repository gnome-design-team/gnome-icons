#!/usr/bin/env ruby

require 'ftools'
require 'fileutils'

OUT="#{ENV['HOME']}/Desktop/"
SIZES=['16x16','22x22','24x24','32x32','48x48','256x256']
if (!ARGV[0].nil? && File.exists?("src/#{ARGV[0]}.svg"))
  SIZES.each do |size|
    if (File.exists?("hicolor/#{size}/apps/#{ARGV[0]}.png"))
      dest = "#{OUT}#{ARGV[0]}/#{size}"
      File.makedirs(dest) unless File.exists?(dest)
      File.copy("hicolor/#{size}/apps/#{ARGV[0]}.png",dest)
    end
  end
  File.copy("src/#{ARGV[0]}.svg","#{OUT}#{ARGV[0]}/source.svg")
  packcmd = "cd #{OUT}#{ARGV[0]} && zip -r ../#{ARGV[0]}.zip ."
  system(packcmd)
  FileUtils.rm_rf("#{OUT}#{ARGV[0]}")
else
  puts 'No icon found'
  puts "\n\nPlease call me as:"
  puts 'dist.rb icon-name'
end
