class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_or_create_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      @user = User.create
      session[:user_id] = @user.id
    end

    # for reset DB
    unless @user
      @user = User.create
      session[:user_id] = @user.id
    end
  end
end
