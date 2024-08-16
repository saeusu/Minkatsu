class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    if params[:search_target] == 'ユーザー'
      @results = User.search_for(params[:keyword], params[:method])
    elsif params[:search_target] == '投稿'
      @results = Post.search_for(params[:keyword], params[:method])
    end
  
    case params[:method]
    when '完全一致'
      @results = @results.where(name: params[:keyword])
    when '前方一致'
      @results = @results.where('name LIKE ?', params[:keyword] + '%')
    when '後方一致'
      @results = @results.where('name LIKE ?', '%' + params[:keyword])
    when '部分一致'
      @results = @results.where('name LIKE ?', '%' + params[:keyword] + '%')
    end
  end
end
