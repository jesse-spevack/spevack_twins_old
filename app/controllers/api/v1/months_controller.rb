class Api::V1::MonthsController < ApplicationController
  def index
    render json: Photo.get_first_photo_of_each_month
  end
end
