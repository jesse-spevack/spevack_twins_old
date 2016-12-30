FactoryGirl.define do
  factory :user do
    provider "Google"
    uid "1234"
    name "Jesse Spevack"
    first_name "Jesse"
    last_name "Spevack"
    image { Faker::Placeholdit.image }
    email "jesse@example.com"
    token "my_token"
    refresh_token "another_token"
    expires_at "1477945241"
    role 0

    factory :admin do
      role 1
    end

  end
end
