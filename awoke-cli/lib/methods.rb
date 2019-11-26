require 'nokogiri'
require 'pry'
require 'open-uri'

@story_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " ", :Backup => " "}

@headline_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " "}
@url_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " "}

@abstract_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " "}

def story_generator
  aclu_story = Story.new("ACLU", "https://www.aclu.org")
  aclu_story.headline = headline_generator("https://www.aclu.org")
  aclu_story.url = url_generator("https://www.aclu.org")
  aclu_story.abstract = abstract_generator(aclu_story.url)
  @story_hash[:ACLU] = aclu_story
  #------------------------------------------
  amnesty_story = Story.new("Amnesty International USA", "www.amnestyusa.org")
  amnesty_story.headline = headline_generator("www.amnestyusa.org")
  amnesty_story.url = url_generator("www.amnestyusa.org")
  amnesty_story.abstract = abstract_generator(amnesty_story.url)
  @story_hash[:Amnesty] = amnesty_story
  #------------------------------------------
  hrw_story = Story.new("Human Rights Watch", "www.hrw.org")
  hrw_story.headline = headline_generator("www.hrw.org")
  hrw_story.url = url_generator("www.hrw.org")
  hrw_story.abstract = abstract_generator(hrw_story.abstract)
  @story_hash[:HRW] = hrw_story
  #------------------------------------------
  splc_story = Story.new("Southern Poverty Law Center", "www.splcenter.org")
  splc_story_headline = headline_generator("www.splcenter.org")
  splc_story.url = url_generator("www.splcenter.org")
  splc_story.abstract = abstract_generator(splc_story.url)
  @story_hash[:SPLC] = splc_story
end

def welcome_menu
	puts "Welcome to Awoke! Select by story, news source, or use our randomizer."
	puts "For story selection, type ‘story'"
	puts "For source selection, type ‘source'"
	puts "For randomizer, type ‘random'"
	puts "To exit, type ‘exit’"
	input_1 = gets.strip
	if input_1 == "exit" || "Exit"
		puts "Thanks for using Awoke!"
	elsif input_1 == "story" || "Story"
		###################################################################################
		
		##################################################################################
		elsif input_1 == "random" || "Random"
		randomizer
		else
		  menu_redirect
  end 
end

def menu_redirect
  puts "Sorry, we don't recognize that input. Returning to main menu..."
  welcome_menu
end
	
def randomizer_selector(story, array)
  puts "To continue reading, type 'continue'"
	puts "To generate a new story, type 'new'"
	input_7 = gets.strip
	if input_7 == "continue"
	  puts "#{story_object_array[z].author}"
	  puts "#{story_object_array[z].text}"
	  end_story_prompt
	  elsif input_7 == "new"
	  randomizer(array)
	else
	  menu_redirect
	end
end

def headline_generator(url)
  if url == "https://www.aclu.org"
    html_aclu = open(url)
    doc_aclu = Nokogiri::HTML(html_aclu)
    headline_aclu = doc_aclu.css('span.is-uppercase').text 
    headline_finisher(headline_aclu, "ACLU")
    elsif url == "https://www.amnesty.org/en/"
    html_amnesty = open(url)
    doc_amnesty = Nokogiri::HTML(html_amnesty)
    headline_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
    headline_finisher(headline_amnesty, "Amnesty International")
    elsif url == "https://www.hrw.org/#"
    html_hrw = open(url)
    doc_hrw = Nokogiri::HTML(html_hrw)
    headline_hrw = doc.css('h3.billboard-title')
    headline_finisher(headline_hrw, "HRW")
    elsif url == "https://www.splcenter.org"
    html_splc = open(url)
    doc_splc = Nokogiri::HTML(html_splc)
    headline_splc = doc_splc.css("div.field-item even")
    headline_finisher(headline_hrw, "SPLC")
  else 
    menu_redirect
  end
end
  
def headline_finisher(headline, source)
  if source == "ACLU"
    if headline.match(/\w/)
      @story_hash[:ACLU].headline == headline
    elsif source == "Amnesty"
      elsif source == "HRW"
      elsif source == "SPLC"
    if !!headline.match(/\w/)
      headline
    else 
      puts "Waiting on #{url} headline..."
    end 
  end
    
      
      

  
  
  
  
  
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  title_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
  if !!title_amnesty.match(/\w/)
    @headline_hash[:Amnesty] = title_amnesty
  else
    puts "Waiting on Amnesty International headline..."
  end
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  title_hrw = doc.css('h3.billboard-title')
  if !!title_hrw.match(/\w/)
    @headline_hash[:HRW] = title_hrw
  else
    puts "Waiting on Human Rights Watch headline..."
  end
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  title_splc = doc_splc.css("div.field-item even")
  if !!title_splc.match(/\w/)
    @headline_hash[:SPLC] = title_splc
  else
    puts "Waiting on SPLC headline..."
  end
end
end

def url_generator
  ########################ACLU#######################
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  step_a_1 = doc_aclu.css("div#hp__top_carousel")
  step_a_2 = step_a_1.css("div.columns")
  step_a_3 = step_a_2.children
  step_a_4 = step_a_3[11]
  step_a_5 = step_a_4.css("a").first
  aclu_url = step_a_5.attributes["href"].value
  ###########Amnesty###############
  html_amnesty = open("https://www.amnesty.org/en")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  step_b_1 = doc_amnesty.css("a.btn--header")
  amnesty_url = "https://www.amnesty.org/#{step_b_1}" 
  ##########HRW#############
  html_hrw = open("https://www.hrw.org")
  doc_hrw = Nokogiri::HTML(html_hrw)
  hrw_url = "https://www.hrw.org#{doc_hrw.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
  @url_hash[:HRW] = hrw_url
  #########SPLC###############
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  step_1 = doc_splc.css("section#highlighted")
  step_2 = step_1.css("div.field-items")
  step_3 = step_2[0].children
  step_4 = step_3[1].children.text
  @url_hash[:SPLC] = "#{step_4.match(/https.*\w/)}"
  ############################
end

def abstract_generator
  #################ACLU################
  html_aclu = open("#{@url_hash[:ACLU]}")
  doc_aclu = Nokogiri::HTML(html_aclu)
  @abstract_hash[:ACLU] = doc_aclu.css("div#tabs").text
  ##############Amnesty################
  html_amnesty = open("#{@url_hash[:Amnesty]}")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  @abstract_hash[:Amnesty] = doc_amnesty.css("p").text
  ################HRW###################
  html_hrw = open("#{@url_hash[:HRW]}")
  doc_hrw = Nokogiri::HTML(html_hrw)
  step_c_1 = doc_hrw.css("p")
  @abstract_hash[:HRW] = step_c_1[3]
  ##############SPLC##################
  html_splc = open("#{@url_hash[:SPLC]}")
  doc_splc = Nokogiri::HTML(html_splc)
  @abstract_hash[:SPLC] = doc_splc.css("p").first.text
end
end
