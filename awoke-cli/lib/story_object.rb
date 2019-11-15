require "pry"
require "nokogiri"
require "open-uri"

class Story 
  
  attr_accessor :name, :text, :source, :author, :article_url
  
  @@story_object_array = [ ]
  @@source_array = [ ]
  
  def initialize(source_name)
    #def initialize
    #@name = name 
    #@text = text 
    #@source = source
    #@author = author
    #if @author == "none"
      #@author = "#{source}"
    #end
    #if !@@source_array.include?(self.source)
      #@@source_array << self.source
    #end
    #@@story_object_array << self
  #end
#end

  end
  
  def headline_scraper(url)
    html = open("#{url}")
    doc = Nokogiri::HTML(html)
    binding.pry
    @title = doc.css('span.is-uppercase').text
  end
    
    
  
  
  #def initialize(name, text, source, author = "none")
    #@name = name 
    #@text = text 
    #@source = source
    #@author = author
    #if @author == "none"
      #@author = "#{source}"
    #end
    #if !@@source_array.include?(self.source)
      #@@source_array << self.source
    #end
    #@@story_object_array << self
  #end
#end


#########################NOKOGIRI WORKSPACE#####################################

def temporary_title_scrape
  html = open("https://www.aclu.org/")
  doc = Nokogiri::HTML(html)
  binding.pry
  title = doc.css('span.is-uppercase').text
end

temporary_title_scrape



