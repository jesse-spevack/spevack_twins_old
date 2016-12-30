require 'rails_helper'

RSpec.feature "admin logs in" do
  scenario "and is at the photo new page" do
    admin = create :admin
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"
    expect(current_path).to eq(new_photo_path)
  end
end
