require 'open-uri'
require 'nokogiri'
require 'pry'

class SocoCoffee::Shops

    @@all = []

    attr_accessor :name, :info, :details

    def initialize(name, info)
        @name = name
        @info = info
        @details = details
        save
    end

    def self.all
        SocoCoffee::Scraper.scrape_details if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end