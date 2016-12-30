require 'rails_helper'

RSpec.describe "get to /photos/first_photo_of_the_month" do
  it "returns the first photo of each unique month / year" do
    photo_1 = create :photo, date: Time.parse("2015-12-29")
    create :photo, date: Time.parse("2015-12-30")
    photo_2 = create :photo, date: Time.parse("2015-1-29")
    photo_3 = create :photo, date: Time.parse("2016-12-29")

    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get "/api/v1/photos/first-photo-of-the-month"
    photo = JSON.parse(response.body)

    expect(response).to be_success
    expect(photo).to be_instance_of(Array)
    expect(photo.count).to eq(3)
  end
end
