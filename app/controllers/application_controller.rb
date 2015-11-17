class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #create a method that restricts acccess to only admins
  def authenticate_admin!
    raise SecurityError unless current_user.try(:admin?)
  end

   rescue_from SecurityError do |exception|
    redirect_to root_url, alert: "You do not have access to that feature."
  end

end
