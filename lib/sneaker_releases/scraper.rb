class SneakerReleases::Scraper
  
  def self.scrape_sneakers
    doc = Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
    
    sneakers = doc.css("div.release-date-text-wrapper")
    sneakers.each do |s|
      name = s.text
      SneakerReleases::Sneakers.new(name)
    end
  end

end