class ShorturlsController < ApplicationController

  def index
    # never all
    @shorturls = Shorturl.page(params[:page])
  end

  def create
    url_hash = SecureRandom.hex(6)
    shorturl_params = params.require(:shorturl).permit(:url)
    @shorturl = Shorturl.new(shorturl_params)
    @shorturl.short_url = url_hash
    if @shorturl.save
      flash[:notice] = "新增成功"
      redirect_to shorturls_path
    else
      flash[:alert] = "[!] 請輸入url"
      redirect_to shorturls_path
    end
  end

  def redirect
    if params.has_key?(:q)
      url = Shorturl.where(:short_url => params[:q])
      if url.exists?
        url.update(:convert_num => url[0].convert_num + 1)
        redirect_to url[0].url
      else
        flash[:alert] = "參數q錯誤"
        redirect_to root_path
      end
    else
      flash[:alert] = "需要有參數q"
      redirect_to root_path
    end
  end

end
