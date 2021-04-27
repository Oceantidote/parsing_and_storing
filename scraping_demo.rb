require 'open-uri'
require 'nokogiri'
require "pry-byebug"

# Let's scrape recipes from http://www.epicurious.com
def scraper(url)

  url = "https://www.bbcgoodfood.com/search/recipes?q=#{url}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.standard-card-new__article-title').each do |element|
    puts element.text.strip
    puts element.attribute('href').value
  end
  # search for next bvutton
  next_btn = html_doc.search('.pagination-arrow').first
  binding.pry
  next_url = next_btn.attribute('href').value
  if next_url
    scraper(next_url)
  end
  # if it exists then we scrape the page the next button links to
end

scraper("chocolate")
