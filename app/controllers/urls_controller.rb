class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url =  Url.find_or_instantiate(url_params[:original])
    
    if @url.save
      redirect_to url_path(@url)
    else
      flash[:error] = @url.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def redirect
    url = Url.search(params[:shortened_url])
    if url 
      redirect_to url.original
    else
      render 'not_found'
    end
  end 

  private
    def url_params
      params.require(:url).permit(:original)
    end
end
