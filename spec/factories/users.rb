FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@test.com" }
    password { "password" }
    first_name { "Linda" }
    last_name { "Jones" }
    phone { "4153700655" }
  end
end
