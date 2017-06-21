class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign up successfully"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "Sign Up failed"
      render 'new'
    end
  end

  def index
    @users = User.all.shuffle
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
