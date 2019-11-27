require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative "awoke-cli/lib/story_object.rb"
require_r

@story_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " ", :Backup => " "}

def story_generator
  aclu_story = Story.new("ACLU", "https://www.aclu.org")
  aclu_story.headline = aclu_headline_scraper
  aclu_story.url = aclu_url_scraper("https://www.aclu.org")
  aclu_story.abstract = aclu_abstract_scraper(aclu_story.url)
  @story_hash[:ACLU] = aclu_story
  #------------------------------------------
  amnesty_story = Story.new("Amnesty International USA", "www.amnestyusa.org")
  amnesty_story.headline = amnesty_headline_scraper
  amnesty_story.url = amnesty_url_scraper
  amnesty_story.abstract = abstract_generator(amnesty_story.url)
  @story_hash[:Amnesty] = amnesty_story
  #------------------------------------------
  hrw_story = Story.new("Human Rights Watch", "www.hrw.org")
  hrw_story.headline = hrw_headline_scraper
  hrw_story.url = hrw_url_scaper
  hrw_story.abstract = abstract_generator(hrw_story.abstract)
  @story_hash[:HRW] = hrw_story
  #------------------------------------------
  splc_story = Story.new("Southern Poverty Law Center", "www.splcenter.org")
  splc_story_headline = splc_headline_scraper
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
		puts @story_hash[:ACLU].headline
	  puts @story_hash[:Amnesty].headline
	  puts @story_hash[:HRW].headline
	  puts @story_hash[:SPLC].headline
	  elsif input_1 == "random" || "Random"
	  randomizer
	  puts @story_hash.sample.headline
		else
		  menu_redirect
		end
  end 
end

def randomizer
  random_story = @story_hash.sample
  puts random_story.headline
  puts random_story.abstract_generator
  puts random_story.story_url
  puts "To generate a new story, type 'random'"
  puts "To return to main menu, type 'menu'"
  input = gets.strip
  if input == "random" || "Random"
    randomizer 
    elsif input == "menu" || "Menu"
    welcome_menu
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

def aclu_headline_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  headline_aclu = doc_aclu.css('span.is-uppercase').text 
  headline_finisher(headline_aclu, "ACLU")
end

def amnesty_headline_scraper
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  headline_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
  headline_finisher(headline_amnesty, "Amnesty International")
end

def hrw_headline_scraper
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  headline_hrw = doc.css('h3.billboard-title')
  headline_finisher(headline_hrw, "HRW")
end

def splc_headline_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  headline_splc = doc_splc.css("div.field-item even")
  headline_finisher(headline_hrw, "SPLC")
end
####################################################################  
def headline_finisher(headline, source)
  source_list = ["ACLU", "Amnesty", "HRW", "SPLC"]
  if headline.match(/\w/)
    @story_hash[:"#{source}"].headline == headline
    else
      puts "Waiting on #{source} headline..."
    end
  end
end
####################################################################
def aclu_url_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  step_a_1 = doc_aclu.css("div#hp__top_carousel")
  step_a_2 = step_a_1.css("div.columns")
  step_a_3 = step_a_2.children
  step_a_4 = step_a_3[11]
  step_a_5 = step_a_4.css("a").first
  aclu_url = step_a_5.attributes["href"].value
end

def amnesty_url_scraper 
  html_amnesty = open("https://www.amnesty.org/en")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  step_b_1 = doc_amnesty.css("a.btn--header")
  amnesty_url = "https://www.amnesty.org/#{step_b_1}"
end 

def hrw_url_scraper
  html_hrw = open("https://www.hrw.org")
  doc_hrw = Nokogiri::HTML(html_hrw)
  hrw_url = "https://www.hrw.org#{doc_hrw.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
  @url_hash[:HRW] = hrw_url
end

def splc_url_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  step_1 = doc_splc.css("section#highlighted")
  step_2 = step_1.css("div.field-items")
  step_3 = step_2[0].children
  step_4 = step_3[1].children.text
  @url_hash[:SPLC] = "#{step_4.match(/https.*\w/)}"
end
####################################################################
def aclu_abstract_generator
  html_aclu = open("#{@story_hash[:ACLU].story_url}")
  doc_aclu = Nokogiri::HTML(html_aclu)
  aclu_abstract = doc_aclu.css("div#tabs").text
end

def amnesty_abstract_generator
  html_amnesty = open("#{@story_hash[:Amnesty].story_url}")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  amnesty_abstract = doc_amnesty.css("p").text
end

def hrw_abstract_generator
  html_hrw = open("#{@story_hash[:HRW].story_url}")
  doc_hrw = Nokogiri::HTML(html_hrw)
  step_c_1 = doc_hrw.css("p")
  hrw_abstract = step_c_1[3]
end

def splc_abstract_generator
  html_splc = open("#{@story_hash[:SPLC].story_url}")
  doc_splc = Nokogiri::HTML(html_splc)
  splc_abstract = doc_splc.css("p").first.text
end
