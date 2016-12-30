require 'rails_helper'

RSpec.describe "get to /photos" do
  it "returns all photos" do
    user = create :user
    create_list :photo, 2
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get "/api/v1/photos"
    photo = JSON.parse(response.body)

    expect(response).to be_success
    expect(photo).to be_instance_of(Array)
    expect(photo.count).to eq(2)
    expect(photo.first["id"]).to eq(Photo.first.id)
    expect(photo.last["id"]).to eq(Photo.last.id)
  end
end
