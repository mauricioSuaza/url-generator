class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
    
  end

  def show
    @url = Url.find(params[:id])
  end

  private

    def url_params

    end
end
