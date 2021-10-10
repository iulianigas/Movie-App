FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password1' }
  end

  trait :invalid_user do
    email { nil }
    password { nil }
  end
end