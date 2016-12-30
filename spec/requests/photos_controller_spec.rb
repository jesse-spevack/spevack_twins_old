require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  context "Visitor navigates to" do
    it "photo#new, they receive 404 page" do
      get :new

      expect(response.status).to eq(404)
    end
  end
end
