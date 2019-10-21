class SneakerReleases::ReleaseDates
  attr_accessor :name, :sneaker, :key_info
  
  @@all = []
  
  def initialize(name)
    @name = name
    @sneaker = sneaker
    add_to_sneaker
    save
  end
  
  def self.all
    SneakerReleases::Scraper.scrape_sneakers if @@all.empty?
    @@all 
  end
  
  def release_date
    SneakerReleases::Scraper.scrape_release_dates(self) if @release_date.empty?
    @release_date
  end
  
  def add_to_sneaker
    @sneaker.release_date << self unless @sneaker.release_date.include?(self)
  end
  
  def save
    @@all << self 
  end
end