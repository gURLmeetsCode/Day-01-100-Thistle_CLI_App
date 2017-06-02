class ThistleDailyMenu::Menu
  attr_accessor :name, :date, :type, :description

  @@all = []

  def self.new_from_scraper(j)
    self.new(
    j.css(".meal-name").first.text.strip,
    j.css(".menu-day-title").text.strip,
    j.css(".meal-type").collect{|type| type.text.strip}.first,
    j.css(".meal-description").first.text.strip
    )
  end

  def initialize(name = nil, date = nil, type = nil, description = nil)
  @name = name
  @date = date
  @type = type
  @description = description
  @@all << self
  end

  def self.all
    @@all
  end


  def self.find(id)
    self.all[id-1]
  end

  def self.open_in_browser
   system("open '#{"https://www.thistle.co/menu/"}'")
  end


  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end


end
