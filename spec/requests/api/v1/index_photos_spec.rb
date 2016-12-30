require 'rails_helper'

RSpec.describe "get to /photos/index" do
  xit "returns next nine most recent photos" do
    user = create :user
    create_list :photo, 10
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get "/api/v1/photos/index"
    photo = JSON.parse(response.body)

    expect(response).to be_success
    expect(photo).to be_instance_of(Array)
    expect(photo.count).to eq(9)
  end
end
