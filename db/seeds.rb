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
cities = %w(Boston Miami Atlanta Denver Richmond)
st = %w(Massachusetts Florida Georgia Colorado Virginia)

(1..5).each do |i|
  Job.create!(
    title: "#{langs[i%7]} developer",
    job_type: "All types",
    description: %{This is a sample job post. Some information about qualifications, benefits, and job responsibilities would typically appear here.},
    salary: "$#{i*10000+50000}",
    apply_at_address: "jsd@example.com",
    city: "#{cities[i%5]}",
    state: "#{st[i%5]}",
    country: "USA",
    zip_code: "00000",
    user_id: user.id)
end
