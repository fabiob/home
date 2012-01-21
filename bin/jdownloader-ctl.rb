#!/usr/bin/ruby

require 'net/http'
require 'uri'

url = 'http://fabio-imac.local:10025'
cmd = ARGV.shift
case cmd
  when 'add'
    url << '/action/add/links/grabber0/start1/' << ARGV.shift
  when 'limit'
    url << '/action/set/download/limit/' << ARGV.shift
  when 'start', 'stop', 'pause', 'toggle', 'reconnect', 'restart', 'shutdown'
    url << '/action/' << cmd
  else
    url << '/' << cmd
end

puts Net::HTTP.get URI.parse url
