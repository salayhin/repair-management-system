

['SuperAdmin', 'Admin', 'Receptionist', 'Technician', 'TopLevelTechnician'].each do |role|
  Role.where(name: role).first_or_create
end

puts "roles created!"

unless (User.find_by email: 'admin@example.com').present?
  User.create!(email: 'admin@example.com', password: 'admin@password', :role_id => Role.first.id)

  puts "#{User.last.email} created!"

  User.last.roles << Role.first

  puts "Role Assigned!"

end