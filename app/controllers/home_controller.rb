class HomeController < ApplicationController
  def index
    redirect_to photos_path
  end
end
