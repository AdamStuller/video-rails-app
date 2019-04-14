# frozen_string_literal: true

class ApplicationController < ActionController::Base


  before_action :require_user

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path unless logged_in?
  end

end
