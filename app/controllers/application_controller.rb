# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate(user)
    session[:current_user] = user.id
  end

  def authorize_user
    redirect_to root_path if current_user.nil?
  end

  def check_login
    redirect_to clock_index_path unless current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user])
  end
end
