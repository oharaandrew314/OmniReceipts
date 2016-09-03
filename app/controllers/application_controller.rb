class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    redirect_to :welcome unless current_user
  end
end
