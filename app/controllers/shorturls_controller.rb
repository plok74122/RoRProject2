class ShorturlsController < ApplicationController
  before_action :set_short_urls, only: [:index, :create]

  def index
    # never all
    @shorturl = Shorturl.new
  end

  def create
    @shorturl = Shorturl.new(url: params[:shorturl][:url])
    if @shorturl.save
      flash[:notice] = "新增成功"
      redirect_to shorturls_path
    else
      render :index
    end
  end

  def redirect
    if params.has_key?(:q)
      url = Shorturl.find_by(:short_url => params[:q])
      if url
        url.increment(:convert_num).save
        redirect_to url.url
      else
        flash[:alert] = "參數q錯誤"
        redirect_to root_path
      end
    else
      flash[:alert] = "需要有參數q"
      redirect_to root_path
    end
  end

  private

  def set_short_urls
    @shorturls = Shorturl.page(params[:page])
  end

end
