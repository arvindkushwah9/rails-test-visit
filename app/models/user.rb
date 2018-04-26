class User < ApplicationRecord

	def self.import(file)
		require 'csv'
		counter = 0

		CSV.foreach(file.path, headers: true) do |row|
	    user = find_by_name(row["name"]) || new  
      user.attributes = row.to_hash 
      user.save! 
       puts "#{name} - #{user.errors.full_messages.join(",")}" if user.errors.any?
      counter += 1 if user.persisted?
	  end

	  puts "Imported #{counter} users"
	end

end
