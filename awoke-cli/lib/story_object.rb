require "pry"
require "nokogiri"
require "open-uri"

class Story 
  
  attr_accessor :name, :abstract, :source, :url
  
  @@story_array = [ ]
  
  def initialize(source)
    @source = source
    @name = name 
    @abstract = abstract
    @url = url 
    if !@@source_array.include?(self.source)
      @@source_array << self.source
      end
    @@story_array << self
  end
end


