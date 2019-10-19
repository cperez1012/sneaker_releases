class SneakerReleases::CLI 
  
  def call
    puts "Welcome to the Sneaker Release page!"
    get_sneakers
    list_sneakers
  end
  
  
  def get_sneakers
    @sneakers = ["Nike Air Force 1 Low What The NYC", "Patta x Air Jordan 7 Icicle", "Puma Clyde Hardwood White Black", "BlackEyePatch x Reebok Daytona DMX II", "Nike Little Posite One Wolf Grey Graffiti", "Air Jordan 10 Seattle", "adidas Harden Vol 4 Collegiate Royal", "adidas Harden Vol 4 Scarlet", "adidas Harden Vol 4 Grey", "adidas Harden Vol 4 Core Black", "adidas Harden Vol 4 Glow Green", "Air Jordan 1 Retro High OG WMNS Fearless"]
  end
  
  def list_sneakers
    @sneakers.each.with_index do |sneaker, index|
      puts "#{index + 1}. #{sneaker}"
    end
  end
end