class Scrapper
  def initialize(url)
    begin
      @page = Nokogiri::HTML(RestClient.get(url))
    rescue
      @page = nil
    end
  end

  def get_title
    @page.nil? ? "Not found" : @page.title 
  end
end