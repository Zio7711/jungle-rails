class UsersController < ApplicationController

  def new
  end

  def create
    new_hash = user_params.transform_values(&:downcase)
    new_hash[:email] = new_hash[:email].strip
    @user = User.new(new_hash)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
