require 'open-uri'
require 'pry'

#responsible for scraping data 

class Scraper
  
  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    student_profile = {}

    student_profile[:profile_quote] = doc.css(".profile-quote").text
    student_profile[:bio] = doc.css(".bio-content.content-holder").css("p").text

    social_links = doc.css(".social-icon-container").css("a").collect {|url| url.attribute("href").text }
      social_links.each do |url|
        if url.include?("twitter") 
          student_profile[:twitter] = url
        elsif url.include?("linkedin") 
        student_profile[:linkedin] = url
        elsif url.include?("github") 
        student_profile[:github] = url
        else 
          student_profile[:blog] = url
          #if the URL includes "", then create a key/value including the URL. 
        end
      end
    student_profile
  end
  

  def self.scrape_index_page(index_url)
    # #lists all of the students 
     # iterating over student cards to pull the desired info
    # need to use .collect so that it returns a new iterated array
    
    scraped_students = {}
    doc = Nokogiri::HTML(open(index_url)) 
    
    doc.css("div.student-card").collect {|student|
    hash = {
      name: student.css("h4.student-name").text,
      location: student.css("p.student-location").text,
      profile_url: student.css("a").attribute("href").value}
      # here you are setting up the keys and values, lastly you are pulling the web html aka value after .org -- pulling their URL
    }
  end 
  
end 



