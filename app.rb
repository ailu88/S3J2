# Call all gems from Gemfile
require 'bundler'
Bundler.require


$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'scrapper'
require 'datasaver'

Scrapper.new.get_townhall_urls
puts "starting to get all townhalls URLs..." 
puts $url_array
puts "townhalls URLs scrapped...."

Scrapper.new.scrapping_townhalls_email #performs scrapping of Val d'Oise Cities
puts "emails scrapped :"
puts $email_list


puts ("Voulez-vous enregistrer vos résultats au format JSON ? (Y/n)") 
	answer = gets.chomp
	if answer == "Y"
		DataSaver.new.save_as_JSON
		puts "Saved in db/emails.json"
	else end 

puts ("Voulez-vous enregistrer vos résultats au format CSV ? (Y/n)") 
	answer = gets.chomp
	if answer == "Y"
		DataSaver.new.save_as_csv
		puts "Saved in db/emails.csv"
	else end 

puts ("Voulez-vous enregistrer vos résultats dans une Google Spreadsheet ? (Y/n)") 
	answer = gets.chomp
	if answer == "Y"
		DataSaver.new.save_as_spreadsheet
		puts "Saved in a spreadheet ! Follow this link : https://docs.google.com/spreadsheets/d/1LyqkUaCtw_4n8TWtgD0GcusTB_qypRA9MIz6tM7FvuI/edit?usp=sharing"
	else end 

# Open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc etc