require 'nokogiri'
require 'open-uri'
require 'pry'

def experiment
  html = open("https://www.aclu.org/news/")
  doc = Nokogiri::HTML(html)
  
  #try_again = doc.xpath(h3[@topnews__description has-font-family-serif pt-xs topnews__large__description])
  
  #article_title = doc.search('h3')
  
  ugh = doc.css("div.news__image__wrapper")
  
  #second_attempt = doc.css("div.topnews blocklink--container")
  #third_attempt = doc.css("h3.topnews__description has-font-family-serif pt-xs topnews__large__description")
  
  #article_title = doc.css("h3").select{|title| title['data-v-a49994a4'] == "topnews__description has-font-family-serif pt-xs topnews__large__description"}
  
  ######################
  #page = Nokogiri::HTML(open(PAGE_URL))
  #news_links = page.css("a").select{|link| link['data-category'] == "news"}
  #news_links.each{|link| puts link['href'] }
  #####################
  
  #experiment = doc.css(".topnews__description has-font-family-serif pt-xs topnews__large__description").text
end

experiment