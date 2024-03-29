require 'rails_helper'

RSpec.describe Photo, type: :model do
  it "returns unique month and year" do
    create :photo, date: Time.parse("2015-12-29")
    create :photo, date: Time.parse("2016-12-29")
    create :photo, date: Time.parse("2015-1-29")

    expect(Photo.unique_month_years).to eq(["12 2015", "12 2016", "01 2015"])
  end

  it "returns photos by month and year" do
    photo_1 = create :photo, date: Time.parse("2015-12-29")
    photo_2 = create :photo, date: Time.parse("2015-12-30")
    create :photo, date: Time.parse("2016-12-29")
    create :photo, date: Time.parse("2015-1-29")

    expect(Photo.month_year("12", "2015")).to eq([photo_1, photo_2])
  end

  it "returns the last photo of each month" do
    photo_1 = create :photo, date: Time.parse("2015-12-29")
    create :photo, date: Time.parse("2015-12-30")
    photo_2 = create :photo, date: Time.parse("2015-1-29")
    photo_3 = create :photo, date: Time.parse("2016-12-29")

    expect(Photo.get_first_photo_of_each_month).to eq([photo_1, photo_2, photo_3])
  end
end
