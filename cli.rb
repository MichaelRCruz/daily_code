require 'json'
require 'uri'
require 'net/http'

user_input = ARGV

params = {
  'email' => user_input[0],
  'password' => user_input[1],
  'title' => user_input[2],
  'content' => user_input[3],
  'language' => user_input[4],
  'snippet' => open(user_input[5]).read
}

json_headers = {"Content-Type" => "application/json", "Accept" => "application/json"}

uri = URI.parse('http://localhost:3000/posts')
http = Net::HTTP.new(uri.host, uri.port)

response = http.post(uri.path, params.to_json, json_headers)
