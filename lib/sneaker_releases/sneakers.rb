class SneakerReleases::Sneakers
  attr_accessor :name, :release_date
  
  @@all = []
  
  def initialize(name, release_date)
    @name = name
    @release_date = release_date
    save
  end
  
  def self.all
    SneakerReleases::Scraper.scrape_sneakers if @@all.empty?
    @@all 
  end
  
  def save
    @@all << self 
  end
end