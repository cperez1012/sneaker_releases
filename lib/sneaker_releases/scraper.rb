class SneakerReleases::Scraper
  
  def self.scrape_sneakers
    doc = Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
    
    sneakers = doc.css("div.release-date-text-wrapper")
    sneakers.each do |s|
      name = s.css("div.release-date-title").text.strip
      SneakerReleases::Sneakers.new(name)
    end
  end
  
  def self.scrape_release_dates
    
  end

end