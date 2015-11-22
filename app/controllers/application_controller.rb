class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def load_user
    unless @user = User.find_by(id: session[:user_id])
      @user = User.create
      session[:user_id] = @user.id
    end
  end
end
