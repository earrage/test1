
# Extract values from multi-line input text and regex list as Hash in lookups
# Return extracted values as Hash with keys as input regex names
def extractFromText(lookups, text)	
	extract = Hash.new

	lookups.each do |key, regex|
		text.each_line do |s|	
			if s.match(regex)
				ext=s.gsub(regex, "")
				ext=ext.gsub(/ /, "")
				ext=ext.gsub(/\n/, "")
				ext=ext.gsub(/seconds/, "")
				extract.store(key, ext)
			end

		end
	end

	return extract
end

# Extract with a Split whitespace with regex input for each line
# Return value as array
def extractFromTextSplit(regex, text)
	extract = Array.new
	text.each_line do |s|	
			if s.match(regex)
				ext=s.split("|")
				extract.push(ext[2])

			end

	end

	return extract

end

def cleanString(value)

	value = value.gsub(/\t/, "")
	value = value.gsub(/ /, "")
	value = value.gsub(/\n/, "")

	return value
end
	
# Add values for two hashes that have the same key
def sumHashes (hash1, hash2)

	hash = Hash.new		
	hash1.each do |key, value|
		
		#newval = hash2["#{key}"] + value
		newval = hash2[key] + value
		hash.store(key, newval)
	end

	return hash
end 
