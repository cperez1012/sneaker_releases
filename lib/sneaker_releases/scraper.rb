class SneakerReleases::Scraper
  
  def self.scrape_sneakers
    doc = Nokogiri::HTML(open("https://releases.kicksusa.com/"))
    
    sneakers = doc.css("article")
      sneakers.each do |s|
      brand = s.css("h2.masonry__item-title-brand").text
      shoe = s.css("h4.masonry__item-title").text
      name = brand + shoe
      release_date = s.css("p.masonry__item-release-date").text.strip
      SneakerReleases::Sneakers.new(name, release_date)
      # binding.pry
    end
  end

end