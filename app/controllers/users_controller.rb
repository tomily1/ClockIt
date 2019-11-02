class UsersController < ApplicationController
  before_action :check_login

  def index
  end

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
    user = User.where(email: user_param[:email])[0]
    if @user
      authenticate(user)
      redirect_to clock_index_path
    else
      flash[:error] = "invalid email, please sign up!"
      render :index
    end
  end

  private

  def user_param
    params.require(:user).permit(:email, :name)
  end
end
