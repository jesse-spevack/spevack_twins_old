require 'rails_helper'

RSpec.feature "admin uploads photo" do
  scenario "from photo new form" do
    admin = create :admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit new_photo_path

    fill_in "Title", with: "My photo title"
    fill_in "Caption", with: "My photo caption"
    fill_in "Date", with: "2015-12-29"
    attach_file "photo[photo]", Rails.root + "spec/fixtures/dummy.png"
    click_button "Upload"

    expect(current_path).to eq(photos_path)
    within ".photo-of-the-day" do
      expect(page).to have_content("My photo title")
      expect(page).to have_content("My photo caption")
      expect(page).to have_css("img")
    end
  end
end
