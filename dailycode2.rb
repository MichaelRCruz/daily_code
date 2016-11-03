# rails s -b 0.0.0.0

# my computer ifconfig --> en0

# http --json POST '192.168.1.183:3000/posts' title='my great title' content='rails sucks' email='test' password='test' snippet="$(echo 'like fuck a dude high' | toilet)" language='ruby'

# serializes ruby hash into json
# thing = JSON.dump({ :a =. 1, :b => 2})
# or
# thing = { :a = 1, :b => 2}.to_json

# puts thing

require 'json'
require 'uri'
require 'net/http'

# follow this pattern
params = { 'title' => 'yo dude', 'content' => 'look at this', 'language' => 'ruby', 'email' => 'test', 'password' => 'test', 'snippet' => 'afds' }
json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}

uri = URI.parse('http://localhost:3000/posts')
http = Net::HTTP.new(uri.host, uri.port)

response = http.post(uri.path, params.to_json, json_headers)
