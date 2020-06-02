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

Group.new(group_name: "Le Wagon", user_id: 2).save
puts "Created Group 1"
Group.new(group_name: "Splitit")
puts "Created Group 2"
Group.new(group_name: "Berlin", user_id: 4).save
puts "Created Group 3"
Group.new(group_name: "Resturant").save
puts "Created Group 4"
Group.new(group_name: "").save
puts "Created Group 5"
Group.new(group_name: "").save
puts "Created Group 6"

puts "Created Groups"
puts "Creating Members"

Member.new(name: "Ammu", user_id: 2).save
Member.new(name: "Jess", user_id: 2).save
Member.new(name: "Olesya", user_id: 2).save
Member.new(name: "Elliot", user_id: 4).save
Member.new(name: "Alex", user_id: 4).save
Member.new(name: "Elliot").save
Member.new(name: "Ammu").save
Member.new(name: "Olesya").save
Member.new(name: "Fabi").save
Member.new(name: "Stefi").save
Member.new(name: "Martin").save
Member.new(name: "Max").save

puts "Creating Group Members"

GroupMember.new(group_id: 1 , member_id: 2).save
GroupMember.new(group_id: 1 , member_id: 3).save
GroupMember.new(group_id: 1 , member_id: 1).save
GroupMember.new(group_id: 2 , member_id: 6).save
GroupMember.new(group_id: 2 , member_id: 7).save
GroupMember.new(group_id: 3 , member_id: 4).save
GroupMember.new(group_id: 3 , member_id: 5).save
GroupMember.new(group_id: 4 , member_id: 6).save
GroupMember.new(group_id: 4 , member_id: 7).save
GroupMember.new(group_id: 5 , member_id: 8).save
GroupMember.new(group_id: 5 , member_id: 9).save
GroupMember.new(group_id: 5 , member_id: 10).save
GroupMember.new(group_id: 6 , member_id: 11).save
GroupMember.new(group_id: 6 , member_id: 12).save

puts "Creating Activity Costs"


ActivityCost.new(actual_cost: 20, service_tip: 2, employer_contribution: 12, total_balance: 12, currency: "EUR", split_type: "equally", paid_by: "Jess", group_id: 1).save

ActivityCost.new(actual_cost: 40, service_tip: 5, employer_contribution: 15, total_balance: 30, currency: "EUR", split_type: "equally", paid_by: "Ammu", group_id: 2).save

ActivityCost.new(actual_cost: 30, total_balance: 30, currency: "EUR", split_type: "individually", paid_by: "Elliot", group_id: 4).save

ActivityCost.new(actual_cost: 10, total_balance: 10, currency: "EUR", split_type: "individually", paid_by: "Max", group_id: 6).save

puts "Creating Splits"

Split.new(activity_cost_id: 1, member_id: 1, individual_balances: 4, status: false).save
Split.new(activity_cost_id: 1, member_id: 2, individual_balances: 4, status: true).save
Split.new(activity_cost_id: 1, member_id: 3, individual_balances: 4, status: false).save
Split.new(activity_cost_id: 2, member_id: 6, individual_balances: 15, status: false).save
Split.new(activity_cost_id: 2, member_id: 7, individual_balances: 15, status: true).save
Split.new(activity_cost_id: 3, member_id: 6, individual_balances: 10, status: true).save
Split.new(activity_cost_id: 3, member_id: 7, individual_balances: 20, status: false).save
Split.new(activity_cost_id: 4, member_id: 11, individual_balances: 6, status: false).save
Split.new(activity_cost_id: 4, member_id: 12, individual_balances: 4, status: false).save

puts "Database Created"




















# puts "user: #{User.count}, sloth: #{Sloth.count}, bookings: #{Booking.count}, Reviews: #{Review.count}"

# puts "Create database: Table User"
