#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'

again = true
map = ARGV.find { |arg| arg.start_with?('-map=') }&.split('=', 2)&.last

while again
  servers = Scraper.parse_servers(map).sort! { |a, b| b.ping <=> a.ping }
  servers.each { |server| puts server.to_s }
  print 'Type \'next\' if you want to load more: '
  again = false unless STDIN.gets.chomp.upcase == 'NEXT'
end
