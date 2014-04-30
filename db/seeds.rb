# Seeding Users
users_count = 10
puts "Seeding Users"

users_count.times do |n|
  User.where(email: "email#{n}@gmail.com").first_or_create(password: "password")
end

puts "Users count is #{User.count}"

# Seeding Projects
projects_count = 10
puts "Seeding Projects"

projects_count.times do |n|
  Project.where(name: "Project_#{n}", organisation: "Organisation_#{n}").first_or_create
end

puts "Projects count is #{Project.count}"

# Seeding Timesheets
timesheets_count = 30
puts "Seeding Timesheets"

timesheets_count.times do |n|
  user_id    = Random.rand(users_count)
  project_id = Random.rand(projects_count)
  Timesheet.where(user_id: user_id, project_id: project_id, start_date: DateTime.now, end_date: (DateTime.now + 1.month)).first_or_create
end

puts "Timesheets count is #{Timesheet.count}"

# Seeding Leave Requests
leave_requests_count = 15
leave_type = ["Annual Leave", "Sick Leave", "Administrative Leave", "Leave Without Pay"]
puts "Seeding Leave Requests"

leave_requests_count.times do |n|
  user_id = Random.rand(users_count)
  type = leave_type[Random.rand(4)]
  LeaveRequest.where(user_id: user_id, type: type, start_date: DateTime.now, end_date: (DateTime.now + 10.days)).first_or_create
end

puts "Leave Requests count is #{LeaveRequest.count}"