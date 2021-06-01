FactoryBot.define do
  factory :actor do
    name {Faker::Name.name}
    age {rand(15..100)}
    currently_working {true}
  end

  factory :movie do
    title {Faker::Movie.title}
    creation_year {rand(1900..2022)}
    genre {Faker::Book.genre}
  end

  factory :studio do
    name {Faker::Name.name}
    location {Faker::Address.state}
  end
end
