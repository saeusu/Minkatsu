# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      flash.now[:notice] = "新規登録が完了しました" if resource.errors.empty?
      flash.now[:alert] = "新規登録に失敗しました" if resource.errors.any?
    end
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to mypage_path, notice: "guestuserでログインしました。"
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
  
  def after_sign_in_path_for(resource)
    mypage_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end  

  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_active
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_user_session_path
      end
    end
  end
  
end

