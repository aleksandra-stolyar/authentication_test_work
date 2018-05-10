7.times do
  Service.create!(
  name: Faker::Company.name,
  remote_logo_url: Faker::Company.logo,
  link: Faker::Internet.url)
end

%w[super_admin user_admin user].each do |name|
  Role.create!(name: name)
end

User.create!(
      email: 'superadmin@new.com',
      password: '12qwaszx',
      full_name: 'Super Admin',
      position: 'best',
      role_id: 1
)
