require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "and is at the photo index page" do
    user = create :user
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"
    expect(current_path).to eq(photos_path)
  end
end
