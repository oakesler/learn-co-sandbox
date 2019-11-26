require "pry"
require "nokogiri"
require "open-uri"

class Story 
  
  attr_accessor :headline, :abstract, :source, :story_url, :home_url
  
  @@story_array = [ ]
  
  def initialize(source, home_url)
    @source = source
    @name = name 
    @abstract = abstract
    @url = url 
    @headline = headline
    if !@@source_array.include?(self.source)
      @@source_array << self.source
      end
    @@story_array << self
  end
end


