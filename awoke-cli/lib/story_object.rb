class Story 
  
  attr_accessor :name, :text, :source, :author
  
  @@story_object_array = [ ]
  @@source_array = [ ]
  def initialize(name, text, source, author = "none")
    @name = name 
    @text = text 
    @source = source
    @author = author
    if @author == "none"
      @author = "#{source}"
    end
    if !@@source_array.include?(self.source)
      @@source_array << self.source
    end
    @@story_object_array << self
  end
end

