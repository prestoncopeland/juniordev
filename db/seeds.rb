# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

langs = %w(Ruby Erlang Haskell Java C# Python Lisp)

(1..20).each do |i|
  Job.create!(
    title: "#{langs[i%7]} developer",
    job_type: "All types",
    description: %{Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum.},
    salary: "$#{i*1000}.00",
    apply_at_address: "jsd@example.com",
    city: "Boston",
    state: "Massachusetts",
    country: "USA",
    zip_code: "01234",
    user_id: user.id)
end
