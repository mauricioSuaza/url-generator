class UrlTitleUpdateWorker
	include Sidekiq::Worker
	
  def perform(id)
  	url = Url.find(id)
    title = Scrapper.new(url.original).get_title
    
   	url.update(title: title)
  end
end