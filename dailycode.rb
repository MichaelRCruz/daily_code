#!/usr/bin/ruby
# chmod +x dailycode.rb
require 'json'
require 'uri'
require 'net/http'
require 'io/console'

command = ARGV.shift
user_input = ARGV

if command == 'push'
  hash = JSON.load(File.read("./credentials.json"))

  params = {
    'email' => hash['email'],
    'password' => hash['password'],
    'title' => user_input[0],
    'content' => user_input[1],
    'language' => user_input[2],
    'snippet' => open(user_input[3]).read
  }

  json_headers = {"Content-Type" => "application/json", "Accept" => "application/json"}

  uri = URI.parse('http://dailycode.herokuapp.com/posts')
  http = Net::HTTP.new(uri.host, uri.port)

  response = http.post(uri.path, params.to_json, json_headers)

elsif command == 'login'
  print 'email: '; user_email = $stdin.gets.chomp
  print 'password: '; user_password = $stdin.noecho(&:gets).chomp

  cool = { :email => user_email, :password => user_password }.to_json

  File.write('./credentials.json', cool)

else
  puts "UNRECOGNIZED COMMAND"
end
