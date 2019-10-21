class SneakerReleases::CLI 
  
  def call
    puts "\nWelcome to the Sneaker Release page!\n"
    puts ""
    sleep (1)
    get_sneakers
    list_sneakers
    get_user_choice
    puts ""
    puts "Type 'close' to exit the page"
    sleep (3)
    see_more
    puts ""
    sleep (3)
    get_user_choice
    puts "Type 'close' to exit the page"
    puts ""
    sleep (3)
    list_sneakers
    get_user_choice
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
    puts ""
    see_more
    puts "Exiting the application..."
    sleep (2)
    puts "Thank you"
    sleep (2)
    exit
  end
end