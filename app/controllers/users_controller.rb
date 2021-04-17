class UsersController < ApplicationController

  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  #strong parameters for editing user (also includes role attribute)
  def edit_user_params
    params.require(:user).permit(
      :role,
      :email,
      :password
    )
  end



end
