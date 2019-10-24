class SneakerReleases::CLI

  def call
    puts ""
    puts "\nWelcome to the Sneaker Release page!\n"
    puts ""
    sleep (1)
    get_sneakers

    menu
  end

  def menu
    puts "Type in the number correlating to sneaker you would like to view the release date for"
    list_sneakers
    get_user_choice
    puts "Would you like to learn more about other sneakers? Enter (y) to see menu or (n) to exit"
    input = gets.strip.downcase
    if input == "y"
      menu
    elsif input == "n"
      close_page
    # elsif input != ""

    else
      close_page
    end
  end

  def get_sneakers
    SneakerReleases::Scraper.scrape_sneakers
    @sneakers = SneakerReleases::Sneakers.all
  end

  def list_sneakers
    puts "Choose a sneaker to view the release date."
    puts ""
    @sneakers.each.with_index(1) do |sneaker, index|
      puts "#{index}. #{sneaker.name}."
    end
  end

  def get_user_choice
    choice = gets.strip.to_i
    show_sneakers(choice) if valid_input(choice, @sneakers)
    if valid_input(choice, @sneakers) == false
      puts "Please try again"
      list_sneakers
      get_user_choice
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def show_sneakers(choice)
    sneaker = @sneakers[choice - 1]
    puts "Here is the release date for #{sneaker.name}: #{sneaker.release_date}"
  end

  private
  def close_page
    puts ""
    puts "Exiting the application..."
    sleep (2)
    puts "Thank you"
    sleep (2)
    exit
  end
end
