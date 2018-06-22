namespace :roles do
  desc 'Creates user roles: rake roles:create'
  task create: [:environment] do
    %w[super_admin user_admin user].each do |name|
      Role.create!(name: name)
    end
  end
end

