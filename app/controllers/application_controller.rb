class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize!
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected
  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize!
    unless authorized?
      render file: "/public/404", status: 404, layout: false
    end
  end

  def authorized?
    current_permission.authorized?(current_user,
                                   params[:controller],
                                   params[:action])
  end
end
