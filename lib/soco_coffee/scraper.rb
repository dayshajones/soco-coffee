require 'open-uri'
require 'nokogiri'
require 'pry'

class SocoCoffee::Scraper

    def self.scrape_details
        doc = Nokogiri::HTML(open("https://www.sonomacounty.com/articles/5-great-coffeehouses-sonoma-county"))
        doc.css('div.content').css('div.field__item').css('div.node__content').each do |shop_details|
            info = shop_details.text.strip
            name = shop_details.css('h4').text.strip
            SocoCoffee::Shops.new(name, info)
        end
    end
end
