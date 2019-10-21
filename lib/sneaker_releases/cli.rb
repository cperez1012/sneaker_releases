class SneakerReleases::CLI 
  
  def call
    puts "\nWelcome to the Sneaker Release page!\n"
    puts ""
    sleep (1)
    get_sneakers
    list_sneakers
    get_user_choice
    puts ""
    see_more
    puts ""
    get_user_choice
    puts "Type 'close' to exit the page"
    close_page
  end
  
  
  def get_sneakers
    SneakerReleases::Scraper.scrape_sneakers
    @sneakers = SneakerReleases::Sneakers.all
  end
  
  def list_sneakers
    puts "Choose a sneaker to view the release date."
    puts ""
    @sneakers.each.with_index(1) do |sneaker, index|
      puts "#{index}. #{sneaker.name}"
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
    puts "Here is the release date for #{sneaker.name}: #{sneaker.release_date}"
  end
  
  def see_more
    sleep (5)
    puts "Choose another sneaker"
    puts ""
    @sneakers.each.with_index(1) do |sneaker, index|
      puts "#{index}. #{sneaker.name}"
    end
  end

  private
  def close_page
    puts "Exiting the application..."
    sleep (1)
    puts "Thank you"
    sleep (1)
    exit
  end
end