class SneakerReleases::CLI 
  
  def call
    puts "\nWelcome to the Sneaker Release page!\n"
    puts ""
    get_sneakers
    list_sneakers
    get_user_choice
  end
  
  
  def get_sneakers
    @sneakers = ["Nike Air Force 1 Low What The NYC", "Patta x Air Jordan 7 Icicle", "Puma Clyde Hardwood White Black", "BlackEyePatch x Reebok Daytona DMX II", "Nike Little Posite One Wolf Grey Graffiti", "Air Jordan 10 Seattle", "adidas Harden Vol 4 Collegiate Royal", "adidas Harden Vol 4 Scarlet", "adidas Harden Vol 4 Grey", "adidas Harden Vol 4 Core Black", "adidas Harden Vol 4 Glow Green", "Air Jordan 1 Retro High OG WMNS Fearless"]
  end
  
  def list_sneakers
    puts "Choose a sneaker to view the release date."
    puts ""
    @sneakers.each.with_index do |sneaker, index|
      puts "#{index + 1}. #{sneaker}"
    end
  end
  
  def get_user_choice
    choice = gets.strip.to_i
    show_sneakers(choice) if valid_input(choice, @sneakers) 
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_sneakers(choice)
    sneaker = @sneakers[choice - 1]
    puts "Here are the release dates for #{sneaker}:"
    # SneakerReleases::Sneakers.all.each.with_index(1) do |release|
    #   puts release.name
    #   get_release_date
    end
  end
end