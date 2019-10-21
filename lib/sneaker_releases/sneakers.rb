class SneakerReleases::Sneakers
  attr_accessor :name
  attr_writer :release_date
  @@all = []
  
  def initialize(name)
    @name = name
    @release_date = []
  end
  
  def self.all
    SneakerReleases::Scraper.scrape_sneakers if @@all.empty?
    @@all 
  end
  
  def release_date
    SneakerReleases::Scraper.scrape_release_date if @release_date.empty?
    @release_date
  end
  
  def save
    @@all << self 
  end
end