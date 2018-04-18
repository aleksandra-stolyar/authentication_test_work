7.times do
  Service.new.tap do |s|
    s.name = Faker::Company.name
    s.logo = Faker::Company.logo
    s.link = Faker::Internet.url
    s.save!
  end
end
