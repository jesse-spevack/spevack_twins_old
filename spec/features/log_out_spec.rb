require 'rails_helper'

RSpec.feature "user logs out" do
  scenario "hover over avatar and click logout" do
    stub_omniauth

    visit root_path
    
    within ".navbar-fixed" do
      click_link "Sign in with Google"
    end

    within "#dropdown1" do
      click_link "Logout"
    end

    within "ul.right" do
      expect(page).to_not have_css("img.responsive-img")
      expect(page).to have_content("Sign in with Google")
    end
  end
end
