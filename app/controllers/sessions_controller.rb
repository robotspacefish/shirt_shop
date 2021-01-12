class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:user][:username])

    # verify user found && password matches
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end
end
