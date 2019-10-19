class SneakerReleases::Sneakers
  @@all = ["Nike Air Force 1 Low What The NYC", "Patta x Air Jordan 7 Icicle", "Puma Clyde Hardwood White Black", "BlackEyePatch x Reebok Daytona DMX II", "Nike Little Posite One Wolf Grey Graffiti", "Air Jordan 10 Seattle", "adidas Harden Vol 4 Collegiate Royal", "adidas Harden Vol 4 Scarlet", "adidas Harden Vol 4 Grey", "adidas Harden Vol 4 Core Black", "adidas Harden Vol 4 Glow Green", "Air Jordan 1 Retro High OG WMNS Fearless"]
  
  attr_accessor :name 
  
  def initialize(name)
    @name = name
  end
  
  def self.all
    SneakerReleases::Scraper.scrape_sneakers if @@all.empty?
    @@all 
  end
  
  def save
    @@all << self 
  end
end