FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    release_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    genre { Faker::FunnyName.name }
    description { Faker::Lorem.paragraphs }
    language { "english" }
    user_id { 1 }
    category_id { 2 }
  end

  trait :invalid_movie do
    title { nil }
    release_date { nil }
    genre { nil }
    description { nil }
    language { nil }
    user_id { nil }
    category_id { nil }
  end
end