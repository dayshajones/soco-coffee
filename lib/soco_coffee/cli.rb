#responsible for communicating btwn user and data
require 'open-uri'
require 'nokogiri'
require 'pry'

class SocoCoffee::CLI
    attr_accessor :name, :info

    def start
        welcome
        menu
    end

    def welcome
        puts "-------------------------------------------------------"
        puts "Welcome to coffee shops, would you like to read about the best coffee shops in Sonoma County? y or n"
        puts "-------------------------------------------------------"
        input = gets.strip
        if input == 'y' 
            list_shops
        elsif input == 'n'
            goodbye
        else
            welcome
        end
    end

    def list_shops 
        SocoCoffee::Shops.all.each_with_index do |shop, i|
            puts ""
            puts "#{i + 1}. #{shop.name}"
            puts ""
        end
    end

    def menu
        input = nil
        while input != ""
            question
            input = gets.strip
            if input == "exit"
                goodbye
            elsif input.to_i <= SocoCoffee::Shops.all.size
                shop = SocoCoffee::Shops.all[input.to_i-1]
                    puts "--------------------------------------------------------------------------------------------------------------"
                    puts "Coffee Shop: #{shop.info}"
                    # puts "#{shop.details}"
                    puts "--------------------------------------------------------------------------------------------------------------"
            else input.to_i > SocoCoffee::Shops.all.size
                invalid
                list_shops
            end
        end
    end

    # def more_details
    #     puts "-------------------------------------------------------"
    #     puts "Which coffee shop would you like more details about"
    #     puts "-------------------------------------------------------"
    #     list_shops
    #     input = gets.strip
    #     if input.to_i <= SocoCoffee::Shops.all.size
    #         shop = SocoCoffee::Shops.all[input.to_i-1]
    #         puts "-------------------------------------------------------"
    #         puts "#{shop.details}"
    #         puts "-------------------------------------------------------"
    #     else
    #         goodbye
    #     end
    # end

    def question
        puts "--------------------------------------------------------------------------------------------------------------"
        puts "Enter a number for more information or exit to quit."
        puts "--------------------------------------------------------------------------------------------------------------"
    end

    def goodbye
        puts "--------------------------------------------------------------------------------------------------------------"
        puts "You must be fully-caffeinated, see you later!"
        puts "--------------------------------------------------------------------------------------------------------------"
        exit
    end

    def invalid
        puts "--------------------------------------------------------------------------------------------------------------"
        puts "Not sure what you mean, please choose again:"
        puts "--------------------------------------------------------------------------------------------------------------"
    end
end