require "pry"

class ThistleDailyMenu::Scraper

    def get_page
      Nokogiri::HTML(open("https://www.thistle.co/menu/"))
    end

    def scrape_page
      self.get_page.xpath(".//div[@class='menu-day']")
    end

    def make_new_menus
      scrape_page.each do |j|
        ThistleDailyMenu::Menu.new_from_scraper(j)
      end
    end

end
