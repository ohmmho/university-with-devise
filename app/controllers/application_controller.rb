class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'open-uri'
  protect_from_forgery with: :exception

  before_action :check_logged_or_not, :except => [:create, :login]

  def current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user ||= User.find(current_user_id)
    end
  end
  helper_method :current_user

  def check_logged_or_not
    if !current_user
      render 'sessions/register'
    end
  end

end
