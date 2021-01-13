class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:user][:username])

    # verify user found && password matches
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid credentials"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
