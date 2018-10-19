#3.times do
#   User.create!(
#     firstName:   Faker::Name.first_name,
#     email:       Faker::Internet.unique.email,
#     password:    Faker::Internet.password(10)
#   )
#end

test1 = User.create!(
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        'test1@gmail.com',
  password:     'helloworld'
)

test2 = User.create!(
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        'test2@gmail.com',
  password:     'helloworld'
)

test3 = User.create!(
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        'test3@gmail.com',
  password:     'helloworld'
)



users = User.all

15.times do
  Athlete.create!(
      user:   users.sample,
      firstName:                    Faker::Name.first_name,
      middleName:                   Faker::Name.first_name,
      preferredName:                Faker::Name.first_name,
      lastName:                     Faker::Name.unique.last_name,
      yearStartingSchool:           'Sept. 2018 - May 2019',
      active:                       Faker::Boolean.boolean(0.7)
  )
end

athletes = Athlete.all

athletes.each do |item|
  Contact.create!(
  athlete:      item,
  email:        Faker::Internet.safe_email,
  phone:        Faker::PhoneNumber.phone_number
)
end

athletes.each do |item|
  Address.create!(
  athlete:      item,
  street:       Faker::Address.street_address,
  street2:      Faker::Address.secondary_address,
  city:         Faker::Address.city,
  state:        Faker::Address.state,
  zip:          Faker::Address.zip_code,
  country:      Faker::Address.country
)
end



24.times do
  Sport.create!(
    athlete:      athletes.sample,
    sportName:    ["Mens Swimming", "Womens Swimming", "Mens Diving", "Womens Diving", "Mens Water Polo", "Womens Water Polo" ].sample,
    active:       Faker::Boolean.boolean(0.7)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Athlete.count} athletes created"
puts "#{Sport.count} sports created for the athletes"
