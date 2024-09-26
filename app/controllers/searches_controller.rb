class SearchesController < ApplicationController
  before_action :authenticate_user_or_admin!
  

  def search
    if params[:search_target] == 'ユーザー'
      @results = User.search_for(params[:keyword], params[:method])
    elsif params[:search_target] == '投稿'
      @results = Post.search_for(params[:keyword], params[:method])
    end

    if params[:method] == '部分一致'
      @results = @results.where('name LIKE ?', '%' + params[:keyword] + '%')
    end
  end
  
  private
  
  def authenticate_user_or_admin!
    unless user_signed_in? || admin_signed_in?
      redirect_to new_user_session_path, alert: "アクセスするにはログインが必要です。"
    end
  end
end
