class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render 'show'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :is_deleted)
  end   
  
end
