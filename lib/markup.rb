#!/usr/bin/ruby

class Markup

	def initialize

		#reads the material list once
		@material_list = {}
		begin
			getMaterialList()
		rescue Exception => e
  			puts e.message  
  			puts e.backtrace
  			exit
  		end

  	end

	def jobMarkUp(basePrice, workers, materialType)

		begin
			# Make sure all inputs are correct type
			raise ArgumentError, "Base Price #{basePrice} must be numeric" unless basePrice.is_a? Numeric
			raise ArgumentError, "workers #{workers} must be Integer" unless workers.is_a? Integer
			raise ArgumentError, "material #{materialType} must be Integer or string" unless
				(materialType.is_a? Integer or materialType.is_a? String)

			# Markups calculated
			person_markup = 0.012 * workers
			material_markup = getMaterialMarkup(materialType)
			initial_markup = 1.05 * basePrice
			final_price = initial_markup * (1 + person_markup + material_markup)

			return final_price.round(2)
		rescue Exception => e
			puts e.message  
  			puts e.backtrace
		end

	end

	def getMaterialMarkup(materialType)

		materialType = materialType.to_s.downcase  #lowercase to be consistent
		markup = @material_list[materialType] if @material_list.key?(materialType)
		return markup.to_f

	end

	def getMaterialList

		markup = 0.0 				# Default markup

		# Check if markup file exists
		raise StandardError, "markups.txt does not exist\n" +
		"please place it in the test directory" if !File.exist?('markups.txt')
		
		# Gets markups from text file, puts into hash
		File.open("markups.txt", "r") do |infile|
	    	while line = infile.gets
	    		#Regex Match each line for data
	    		line = line.strip.downcase
	        	id, types, percent = line.match(/^(\d*)\s*(.*?)\s+([\d\.]*$)/).captures

	        	# file formatting incorrect
	        	if id == "" || percent == ""
	        		raise StandardError, "markups.txt is not formatted properly"
	        	end
	        	raise StandardError, "ID \"#{id}\" exists more than once in markups.txt" if @material_list.key?(id)
	        	types = types.strip.split
	        	@material_list[id] = percent
	        	types.each { 
	        				|type|
	        				raise StandardError, "matrial \"#{type}\" exists more" +
	        				" than once in markups.txt" if @material_list.key?(type)
	        				@material_list[type] = percent
	        				}
	    	end

		end
		
	end

end
