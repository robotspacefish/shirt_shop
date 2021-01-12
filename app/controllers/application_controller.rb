class ApplicationController < ActionController::Base
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def is_current_user?(user)
      user == current_user
    end

    def redirect_if_not_logged_in
      redirect_to login_path if !logged_in?
      flash[:message] =  "You must log in to view that page."
    end

    def redirect_if_logged_in
      redirect_to user_path(current_user) if logged_in?
    end
end
