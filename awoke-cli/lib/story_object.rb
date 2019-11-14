class Story 
  
  attr_accessor :name, :text, :source, :author
  
  @@story_object_array = [ ]
  def initialize(name, text, source, author = "none")
    @name = name 
    @text = text 
    @source = source
    if @author == "none"
      @author = "#{source}"
      @@story_object_array << self
    end
  end 
end