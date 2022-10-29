class AdminUsersController < ApplicationController
  def new
   @user = AdminUser.new
  end

  def create
   user =AdminUser.new(admin_user_params)
   if user.save
     session[:user_id] = user.id
     redirect_to admin_user_path
   else
    render :new
   end
  end

  def show
  end
  
  private
  def admin_user_params
   params.require(:user).permit(:email, :password)
  end
end
