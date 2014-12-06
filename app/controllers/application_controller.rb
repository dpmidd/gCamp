class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  before_action :validates_user_is_present

  helper_method :current_user

  class AccessDenied < StandardError

  end

  rescue_from AccessDenied, with: :access_denied

  def access_denied
    render "public/404", layout: false, status: 404
  end

  def validates_user_is_present
    redirect_to signin_path, notice: "You must be logged in to access that information" unless current_user.present?
  end

  def tasks_id_match
  end

end
