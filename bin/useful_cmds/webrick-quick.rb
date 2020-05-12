#!/usr/bin/env ruby

require 'webrick'

dir = Dir::pwd
port = 6000 # + (dir.hash % 1000)
puts "URL: http://#{Socket.gethostname}:#{port}"

server = WEBrick::HTTPServer.new :BindAddress => '0.0.0.0', :Port => port, :DocumentRoot => dir
trap("INT"){ server.shutdown }
server.start
