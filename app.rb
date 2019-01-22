# Call all gems from Gemfile
require 'bundler'
Bundler.require


$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'scrapper'
require 'datasaver'


Scrapper.new.scrapping_townhalls_email

Datasaver.new.save_as_csv



# Open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc etc