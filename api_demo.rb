
require 'json'
require 'open-uri'

def request
  puts "Enter github username"
  puts ">"
  username = gets.chomp
  url = "https://api.github.com/users/#{username}"
  user_serialized = URI.open(url).read
  # puts user_serialized
  user = JSON.parse(user_serialized)
  puts "#{user['name']} - #{user['bio']} - repos #{user["public_repos"]}"
  request
end

request
