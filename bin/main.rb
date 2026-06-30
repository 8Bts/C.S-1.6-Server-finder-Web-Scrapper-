#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'

def positive_integer_arg(name)
  value = ARGV.find { |arg| arg.start_with?("-#{name}=") }&.split('=', 2)&.last
  return nil if value.nil?
  return value.to_i if value.match?(/\A[1-9]\d*\z/)

  puts "#{name} must be a positive integer"
  exit 1
end

again = true
map = ARGV.find { |arg| arg.start_with?('-map=') }&.split('=', 2)&.last
max_ping = positive_integer_arg('max_ping')

while again
  servers = Scraper.parse_servers(map).sort! { |a, b| b.ping <=> a.ping }
  servers = servers.select { |server| server.ping <= max_ping } unless max_ping.nil?
  if servers.empty?
    puts 'No results were found.'
    exit
  end

  servers.each { |server| puts server.to_s }
  print 'Type \'next\' if you want to load more: '
  again = false unless STDIN.gets.chomp.upcase == 'NEXT'
end
