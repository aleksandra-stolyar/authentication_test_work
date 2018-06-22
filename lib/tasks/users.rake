namespace :users do
  desc 'Creates users: rake users:create'
  task create: [:environment] do
    10.times { create_user }
  end

  def create_user
    User.create!(
          email: Faker::Internet.email,
          password: '12qwaszx',
          full_name: Faker::Name.name,
          position: Faker::Company.profession,
          role: Role.find_by(name: 'user')
    )
  end
end
