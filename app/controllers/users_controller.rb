# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_login, except: [:logout]
  before_action :authorize_user, only: [:logout]

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: user_param[:name], email: user_param[:email])
    if @user.save
      authenticate(@user)
      redirect_to clock_index_path
    else
      render :new
    end
  end

  def login
    @user = User.where(email: user_param[:email])[0]
    if @user
      authenticate(@user)
      redirect_to clock_index_path
    else
      flash[:error] = 'invalid email, please sign up!'
      render :index
    end
  end

  def logout
    @current_user = nil
    reset_session
    flash[:success] = 'successfully logged out'
    redirect_to root_path
  end

  private

  def user_param
    params.require(:user).permit(:email, :name)
  end
end
