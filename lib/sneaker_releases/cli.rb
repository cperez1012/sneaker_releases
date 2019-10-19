class SneakerReleases::CLI 
  
  def call
    puts "\nWelcome to the Sneaker Release page!\n"
    puts ""
    get_sneakers
    list_sneakers
    get_user_choice
  end
  
  
  def get_sneakers
    SneakerReleases::Scraper.scrape_sneakers
    @sneakers = SneakerReleases::Sneakers.all
  end
  
  def list_sneakers
    puts "Choose a sneaker to view the release date."
    puts ""
    @sneakers.each.with_index do |sneaker, index|
      puts "#{index + 1}. #{sneaker.name}"
    end
  end
  
  def get_user_choice
    choice = gets.strip.to_i
    show_sneakers(choice) if valid_input(choice, @sneakers) 
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_sneakers(choice)
    sneaker = @sneakers[choice - 1]
    puts "Here is the release dates for #{sneaker}:"
    # SneakerReleases::Sneakers.all.each.with_index(1) do |release|
    #   puts release.name
    #   get_release_date
    #end
  end  
end