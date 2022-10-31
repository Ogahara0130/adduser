class SessionsController < ApplicationController
  def new
  end

  def create
    user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_user_path
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_user_path
  end
end
