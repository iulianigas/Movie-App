FactoryBot.define do
  factory :category do
    name { 'Fight and Blood' }
    
  end

  trait :invalid_category do
    name { nil }
  end
end