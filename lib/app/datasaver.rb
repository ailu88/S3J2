class DataSaver



	def save_as_JSON
		File.open("db/emails.json","w+") do |f|
		  puts f.write($email_list.to_json)
		end
	end 

	def save_as_spreadsheet
		
		session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1LyqkUaCtw_4n8TWtgD0GcusTB_qypRA9MIz6tM7FvuI").worksheets[0]

		# Gets content of A2 cell.
		p ws[2, 1]  #==> "hoge"

		# Changes content of cells.
		# Changes are not sent to the server until you call ws.save().
		# ws[1, 1] = "YOUPI"
		# ws[2, 2] = "MISTERAYS"
		# ws[8, 3] = "MISTERAYS"
		# ws.save

		(0..$email_list.length-1).each do |i|
			hash = $email_list[i]
			puts hash
			keys = $email_list[i].keys
			puts keys
			ws[i+1, 1] = keys[0] # ville
			ws[i+1, 2] = hash[keys[0]] # email de la mairie
			end 
		ws.save

		# Print code cell by cell
		# (1..ws.num_rows).each do |row|
		# (1..ws.num_cols).each do |col|
		#    p ws[row, col]
		#  end
		# end


		# Print spreadsheet in the form of hashes (by row)
		# p ws.rows

		# Reloads the worksheet to get changes by other clients.
		ws.reload

	end 

	def save_as_csv

		CSV.open("db/emails.csv", "wb") do |csv|


			(0..$email_list.length-1).each do |i|
				
				hash = $email_list[i]
				keys = $email_list[i].keys

				ville = keys[0] 
				email = hash[keys[0]]
				
				input = [ville, email]

	  		csv << input

	  		end
		end
	end
end 
