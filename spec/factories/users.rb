require "faker"

FactoryBot.define do
  factory :user do |f|
    f.name {Faker::Name.name}
    f.email {Faker::Name.first_name + "@gmail.com"}
    f.password "147852369"
    f.password_confirmation "147852369"
  end
end
