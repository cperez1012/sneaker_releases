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
    doc = Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
    
    release_date = doc.css("div.release-date-text-wrapper")
    release_date.each do |r|
      name = r.css("div")[1].text.strip
      SneakerReleases::ReleaseDates.new(name)
    end
  end

end