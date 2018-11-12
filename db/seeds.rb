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
  Academic.create!(
  athlete:      item,
  schoolName:   Faker::Name.name,
  phone:        Faker::PhoneNumber.phone_number,
  satMath:      Faker::Number.between(200, 800),
  satEnglish:   Faker::Number.between(200, 800),
  satTotal:     Faker::Number.between(400, 1600),
  actTotal:     Faker::Number.between(2, 37),
  gpa:          Faker::Number.between(0, 4),
  gpaScale:     Faker::Number.between(0, 8),
  classRank:    Faker::Number.between(1, 1200),
  classSize:    Faker::Number.between(1, 1200),
  notes:        Faker::Community.quotes
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
  country:      "Canada"
)
end

athletes.each do |item|
  CounselorContact.create!(
  athlete:      item,
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        Faker::Internet.safe_email,
  phone:        Faker::PhoneNumber.phone_number
)
end

athletes.each do |item|
  CurrentAddress.create!(
  athlete:      item,
  street:       Faker::Address.street_address,
  street2:      Faker::Address.secondary_address,
  city:         Faker::Address.city,
  state:        Faker::Address.state,
  zip:          Faker::Address.zip_code,
  country:      "USA"
)
end

athletes.each do |item|
  FatherContact.create!(
  athlete:      item,
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        Faker::Internet.safe_email,
  phone:        Faker::PhoneNumber.phone_number
)
end

athletes.each do |item|
  FatherAddress.create!(
  athlete:      item,
  street:       Faker::Address.street_address,
  street2:      Faker::Address.secondary_address,
  city:         Faker::Address.city,
  state:        Faker::Address.state,
  zip:          Faker::Address.zip_code,
  country:      Faker::Address.country
)
end

athletes.each do |item|
  MotherContact.create!(
  athlete:      item,
  firstName:    Faker::Name.first_name,
  lastName:     Faker::Name.unique.last_name,
  email:        Faker::Internet.safe_email,
  phone:        Faker::PhoneNumber.phone_number
)
end

athletes.each do |item|
  MotherAddress.create!(
  athlete:      item,
  street:       Faker::Address.street_address,
  street2:      Faker::Address.secondary_address,
  city:         Faker::Address.city,
  state:        Faker::Address.state,
  zip:          Faker::Address.zip_code,
  country:      "USA"
)
end


athletes.each do |item|
  SchoolAddress.create!(
  athlete:      item,
  street:       Faker::Address.street_address,
  street2:      Faker::Address.secondary_address,
  city:         Faker::Address.city,
  state:        Faker::Address.state,
  zip:          Faker::Address.zip_code,
  country:      "USA"
)
end

athletes.each do |item|
  Sibling.create!(
  athlete:      item,
  siblingNames: Faker::Name.first_name
)
end



24.times do
  Sport.create!(
    athlete:      athletes.sample,
    sportName:    ["Men's Swimming", "Women's Swimming", "Men's Diving", "Women's Diving", "Men's Water Polo", "Women's Water Polo" ].sample,
    active:       Faker::Boolean.boolean(0.7)
  )
end


sports = Sport.all

sports.each do |item|
  if item.sportName == "Men's Swimming" || item.sportName == "Women's Swimming"
    Swimming.create!(
      sport:      item,
      frSCY50:      "23.45",
      frSCM50:      "24.45",
      frLCM50:      "25.45",
      frSCY100:     "53.45",
      frSCM100:     "54.45",
      frLCM100:     "55.45"
    )
  elsif item.sportName == "Men's Diving" || item.sportName == "Women's Diving"
    Diving.create!(
      sport:      item,
      oneD1score:   "79.83",
      oneD1name:    "Forward Dive in the Pike Position (100B)",
      oneD1date:    "1/12/2018",
      threeD1score:   "83.43",
      threeD1name:    "Reverse 1.5 Somersaults in the Pike Position (303B)",
      threeD1date:    "1/14/2018",
      tenD1score:   "67.99",
      tenD1name:    "Armstand Reverse 2 Somersaults in the Tuck Position (634C)",
      tenD1date:    "1/15/2018"  
    )

  elsif item.sportName == "Men's Water Polo" || item.sportName == "Women's Water Polo"
    Waterpolo.create!(
      sport:      item,
      frSCY50:      "23.45",
      frSCY100:     "53.45",
      height:       "5'10",
      weight:       "175",
      jersey:       "14",
      defender:     false,
      attacker:     true,
      utility:      false,
      right:        true,
      left:         false
    )

  end
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Athlete.count} athletes created"
puts "#{Sport.count} sports created for the athletes"
