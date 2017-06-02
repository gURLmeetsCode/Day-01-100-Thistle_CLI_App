class ThistleDailyMenu::CLI

  def call
    ThistleDailyMenu::Scraper.new.make_new_menus
    start
  end

  def list
    puts ""
    puts "*******This Week's Breakfast Menu from Thistle.co***************"
    puts ""
    puts ""
    ThistleDailyMenu::Menu.all.each.with_index(1) do |menu, i|
        puts "#{i}. #{menu.date}"
        puts ""
        puts "Menu Item Information"
        puts ""
        puts "Meal Type: #{menu.type}"
        puts "#{menu.name}"
        puts "Description: #{menu.description}"
        puts "----------------------"
      end
  end


  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What menu item would you more information on, type a number"
      puts ""
      puts "Enter list to see the menu items again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i > 0
        if menu = ThistleDailyMenu::Menu.all[input.to_i-1]
        puts "
        #{menu.date}
        #{menu.name}
        #{menu.description}"
        end
        puts "Would you like to see the nutritional info?"
        answer = gets.strip
        if ["Y", "YES"].include?(answer.upcase)
          ThistleDailyMenu::Menu.open_in_browser
        end
      end
    end
    puts "Check out the full menu on Thistle.co"
  end
end
