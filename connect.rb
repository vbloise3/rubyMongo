require 'rubygems'
require 'mongo'

$client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'tutorial')
Mongo::Logger.logger.level = ::Logger::ERROR
$users = $client[:users]
puts 'connected!'

bloise = {"last_name" => "bloise", "age" => 54}
dude = {"last_name" => "The Dude", "age" => 45}

#bloise_id = $users.insert_one(bloise)
#dude_id = $users.insert_one(dude)

puts "Valid users:"
$users.find().each do |user|
    puts user
end

puts "Users older than 20"
p $users.find("age" => {"$gt" => 20}).each.to_a

$users.find({"last_name" => "The Dude"}).update_one({"$set" => {"age" => 55}})

puts "Users older than 30 by last name:"
cursor = $users.find({"age" => {"$gt" => 30}})
cursor.each do |doc|
    puts doc["last_name"]
end


