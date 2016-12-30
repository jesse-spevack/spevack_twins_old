FactoryGirl.define do
  factory :photo do
    title "My great title"
    caption "My great caption"
    photo { Faker::Placeholdit.image }
    date Time.parse("2015-12-29")
  end
end
