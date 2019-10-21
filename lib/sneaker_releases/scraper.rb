class SneakerReleases::Scraper
  
  def self.scrape_sneakers
    doc = Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
    binding.pry
    sneakers = doc.css("div.release-date-text-wrapper")
      sneakers.each do |s|
      name = s.css("div.release-date-title").text.strip
      release_date = s.css("div")[1].text.strip
      SneakerReleases::Sneakers.new(name, release_date)
       
    end
  end

end