class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      flash[:notice] = 'Account successfully created!'
      redirect_to root_path
    else
      flash.now.alert = 'Oops. Check your email and password and try again.'
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
    end
end
