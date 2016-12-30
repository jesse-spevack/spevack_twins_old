require 'rails_helper'

RSpec.feature "visitor sees photo of the day" do
  scenario "is redirected to photo/index" do
    visit root_path
    expect(current_path).to eq(photos_path)
  end
end
