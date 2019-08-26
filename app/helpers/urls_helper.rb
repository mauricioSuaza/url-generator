module UrlsHelper
  def complete_path(url)
    request.base_url + "/" +  @url.shortened
  end

end
