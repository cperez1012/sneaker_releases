class SneakerReleases::Sneakers
  attr_accessor :name, :release_date
  
  @@all = []
  
  def initialize(name)
    @name = name
    @release_date = []
    save
  end
  
  def self.all
    SneakerReleases::Scraper.scrape_sneakers if @@all.empty?
    @@all 
  end

  def get_release_date
    SneakerReleases::Scraper.scrape_release_dates(self) if @release_date.empty?
  end
  
  def save
    @@all << self 
  end
end