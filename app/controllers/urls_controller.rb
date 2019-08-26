class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)

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

  private

    def url_params
      params.require(:url).permit(:original)
    end
end
