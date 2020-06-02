# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Split.destroy_all
ActivityCost.destroy_all
GroupMember.destroy_all
Member.destroy_all
Group.destroy_all
User.destroy_all

puts "Database cleaned..."

puts "Creating Users"

User.new(username: "aamruth", email: "aamruth@test.com", password: "123456").save
puts "User 1 created"
User.new(username: "elliot", email: "elliot@test.com", password: "123456").save
puts "User 2 created"
User.new(username: "olesya", email: "olesya@test.com", password: "123456").save
puts "User 3 created"
User.new(username: "jessica", email: "jessica@test.com", password: "123456").save
puts "User 4 created"

puts "Created Users"
puts "Creating Groups"

Group.new(group_name: "Le Wagon", user_id: "#{User.first.id + 1}").save
puts "Created Group 1"
Group.new(group_name: "Splitit").save
puts "Created Group 2"
Group.new(group_name: "Berlin", user_id: "#{User.first.id + 3}" ).save
puts "Created Group 3"
Group.new(group_name: "Resturant").save
puts "Created Group 4"
Group.new(group_name: "").save
puts "Created Group 5"
Group.new(group_name: "").save
puts "Created Group 6"

puts "Created Groups"
puts "Creating Members"

Member.new(name: "Ammu", user_id: "#{User.first.id + 1}").save
puts "Creating Members 1"
Member.new(name: "Jess", user_id: "#{User.first.id + 1}").save
puts "Creating Members 2"
Member.new(name: "Olesya", user_id: "#{User.first.id + 1}").save
puts "Creating Members 3"
Member.new(name: "Elliot", user_id: "#{User.first.id + 3}").save
puts "Creating Members 4"
Member.new(name: "Alex", user_id: "#{User.first.id + 3}").save
puts "Creating Members 5"
Member.new(name: "Elliot").save
puts "Creating Members 6"
Member.new(name: "Ammu").save
puts "Creating Members 7"
Member.new(name: "Olesya").save
puts "Creating Members 8"
Member.new(name: "Fabi").save
puts "Creating Members 9"
Member.new(name: "Stefi").save
puts "Creating Members 10"
Member.new(name: "Martin").save
puts "Creating Members 11"
Member.new(name: "Max").save
puts "Creating Members 12"

puts "Created Members"

puts "Creating Group Members"

GroupMember.new(group_id: "#{Group.first.id}" , member_id: "#{Member.first.id + 1}").save
puts "Creating Group Member 1"

GroupMember.new(group_id: "#{Group.first.id}" , member_id: "#{Member.first.id + 2}").save
puts "Creating Group Member 2"

GroupMember.new(group_id: "#{Group.first.id}" , member_id: "#{Member.first.id}").save
puts "Creating Group Member 3"

GroupMember.new(group_id: "#{Group.first.id + 1}", member_id: "#{Member.first.id + 5}").save
puts "Creating Group Member 4"

GroupMember.new(group_id: "#{Group.first.id + 1}" , member_id: "#{Member.first.id + 6}").save
puts "Creating Group Member 5"

GroupMember.new(group_id: "#{Group.first.id + 2}" , member_id: "#{Member.first.id + 3}").save
puts "Creating Group Member 6"

GroupMember.new(group_id: "#{Group.first.id + 2}" , member_id: "#{Member.first.id + 4}").save
puts "Creating Group Member 7"

GroupMember.new(group_id: "#{Group.first.id + 3}" , member_id: "#{Member.first.id + 5}").save
puts "Creating Group Member 8"

GroupMember.new(group_id: "#{Group.first.id + 3}" , member_id: "#{Member.first.id + 6}").save
puts "Creating Group Member 9"

GroupMember.new(group_id: "#{Group.first.id + 4}" , member_id: "#{Member.first.id + 7}").save
puts "Creating Group Member 10"

GroupMember.new(group_id: "#{Group.first.id + 4}" , member_id: "#{Member.first.id + 8}").save
puts "Creating Group Member 11"

GroupMember.new(group_id: "#{Group.first.id + 4}" , member_id: "#{Member.first.id + 9}").save
puts "Creating Group Member 12"

GroupMember.new(group_id: "#{Group.first.id + 5}" , member_id: "#{Member.first.id + 10}").save
puts "Creating Group Member 13"

GroupMember.new(group_id: "#{Group.first.id + 5}" , member_id: "#{Member.first.id + 11}").save
puts "Creating Group Member 14"

puts "Created Group Members"

puts "Creating Activity Costs"


ActivityCost.new(actual_cost: 20, service_tip: 2, employer_contribution: 12, total_balance: 12, currency: "EUR", split_type: "equally", paid_by: "Jess", group_id: "#{GroupMember.first.id}").save

puts "Creating Activity Costs 1"

ActivityCost.new(actual_cost: 40, service_tip: 5, employer_contribution: 15, total_balance: 30, currency: "EUR", split_type: "equally", paid_by: "Ammu", group_id: "#{GroupMember.first.id + 1}").save
puts "Creating Activity Costs 2"


ActivityCost.new(actual_cost: 30, total_balance: 30, currency: "EUR", split_type: "individually", paid_by: "Elliot", group_id: "#{GroupMember.first.id + 3}").save
puts "Creating Activity Costs 3"


ActivityCost.new(actual_cost: 10, total_balance: 10, currency: "EUR", split_type: "individually", paid_by: "Max", group_id: "#{GroupMember.first.id + 5}").save
puts "Creating Activity Costs 4"

puts "Created Activity Costs"


puts "Creating Splits"

Split.new(activity_cost_id: "#{ActivityCost.first.id}", member_id: "#{Member.first.id}", individual_balances: 4, status: false).save
puts "Creating Splits 1"

Split.new(activity_cost_id: "#{ActivityCost.first.id}", member_id: "#{Member.first.id + 1}", individual_balances: 4, status: true).save
puts "Creating Splits 2"

Split.new(activity_cost_id: "#{ActivityCost.first.id}", member_id: "#{Member.first.id + 2}", individual_balances: 4, status: false).save
puts "Creating Splits 3"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 1}", member_id: "#{Member.first.id + 5}", individual_balances: 15, status: false).save
puts "Creating Splits 4"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 1}", member_id: "#{Member.first.id + 6}", individual_balances: 15, status: true).save
puts "Creating Splits 5"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 2}", member_id: "#{Member.first.id + 5}", individual_balances: 10, status: true).save
puts "Creating Splits 6"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 2}", member_id: "#{Member.first.id + 6}", individual_balances: 20, status: false).save
puts "Creating Splits 7"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 3}", member_id: "#{Member.first.id + 10}", individual_balances: 6, status: false).save
puts "Creating Splits 8"

Split.new(activity_cost_id: "#{ActivityCost.first.id + 3}", member_id: "#{Member.first.id + 11}", individual_balances: 4, status: false).save
puts "Creating Splits 9"

puts "Created Splits"


puts "Database Created"




















# puts "user: #{User.count}, sloth: #{Sloth.count}, bookings: #{Booking.count}, Reviews: #{Review.count}"

# puts "Create database: Table User"



















# puts "user: #{User.count}, sloth: #{Sloth.count}, bookings: #{Booking.count}, Reviews: #{Review.count}"

# puts "Create database: Table User"
