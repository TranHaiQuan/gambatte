5.times do |n|
  name = "user#{n+1}-#{Faker::Name.name}"
  email = "user#{n+1}@gmail.com"
  phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_name
  if n%2 == 1
    sex = 0
  else
    sex = 1
  end
  password = "147852369"
  password_confirmation = "147852369"
  User.create!(name: name, email: email, sex: sex, password: password,
    password_confirmation: password_confirmation)
end
