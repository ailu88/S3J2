require 'open-uri'

class Scrapper

	attr_accessor :scrapped_result_array

	def get_townhall_urls	# creates an array with URLs of all towns from Dep 95

		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

		$url_array = []
		urls_raw = page.xpath('//*/a[@class="lientxt"]')

		urls_raw.each do |url|
		    $url_array << "http://annuaire-des-mairies.com"+url['href'].slice(1..-1)
		    end
		return $url_array

	end


	def get_townhall_email(townhall_url)	# given a town's URL, returns its contact e-mail

		page = Nokogiri::HTML(open(townhall_url))
		townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
		return townhall_email

	end 


	def get_townhall_name(townhall_url)	#given a town's URL, returns its name

		page = Nokogiri::HTML(open(townhall_url))
		townhall_name_raw = page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text
		townhall_name = townhall_name_raw[0].capitalize+townhall_name_raw.slice(0..-9).split('-').map(&:capitalize).map{|a| a.length <=3 ? a.downcase : a}.join('-')[1..-1]
		return townhall_name

	end 


	def scrapping_townhalls_email		# creates a hash with the town name associated with its email for all URLs of Dep 95.

		get_townhall_urls

		$email_list = [] 
			$url_array.each do |town_url|
				hash = { get_townhall_name(town_url) => get_townhall_email(town_url)}
				$email_list << hash
			end

		return $email_list
		puts $email_list
		$scrapped_result_array = $email_list
	end 

	begin 								# Manage Exceptions
		scrapping_townhalls_email
	rescue => e 
		puts "Oups petite erreur mais c'est pas grave"
	end 

end 