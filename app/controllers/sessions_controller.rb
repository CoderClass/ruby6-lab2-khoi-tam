class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: login_params[:email])
      if @user.authenticate(login_params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Singed In"
        redirect_to users_path
      else
        flash[:error] = "Password is not correct"
        render 'new'
      end
    else
      flash[:error] = "User does not exist"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end

  def login_params
    params.permit(:email, :password)
  end

end
