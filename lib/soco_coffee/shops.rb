require 'open-uri'
require 'nokogiri'
require 'pry'

class SocoCoffee::Shops

    @@all = []

    attr_accessor :name, :info

    def initialize(name, info)
        @name = name
        @info = info
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