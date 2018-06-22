7.times do
  Service.create!(
  name: Faker::Company.name,
  remote_logo_url: Faker::Company.logo,
  link: Faker::Internet.url)
end

User.create!(
      email: 'superadmin@new.com',
      password: '12qwaszx',
      full_name: 'Super Admin',
      position: 'best',
      role: Role.find_by(name: 'super_admin')
)
