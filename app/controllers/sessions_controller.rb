class SessionsController < ApplicationController
  def new
    @user = User.new
    render "register"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to "/"
    else
      render :register
    end
  end

  def login
    user = User.where(email: params[:email]).first

    # Session engaged
    if user && user.authenticate(params[:password])
      flash[:success] = "Login sucessful! Welcome #{user.email}!"

      session[:current_user_id] = user.id
    else
      flash[:error] = "Login was not sucessful"
    end

    redirect_to "/"
  end
  def logout
    session[:current_user_id] = nil

    redirect_to "/"
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
