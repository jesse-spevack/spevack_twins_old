class Permission
  def initialize(user)
    @user ||= User.new
  end

  def authorized?(user, controller, action)
    if user && user.admin?
      return true if controller == "photos" && action.in?(%w(new index create))
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(create destroy))
      return true if controller == "api/v1/photos" && action.in?(%w(index))
    elsif user
      return true if controller == "photos" && action.in?(%w(index))
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(create destroy))
      return true if controller == "api/v1/photos" && action.in?(%w(index))
    else
      return true if controller == "photos" && action.in?(%w(index))
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "sessions" && action.in?(%w(create))
    end
  end
end
