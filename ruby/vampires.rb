puts "How many employees will be processed?"
employees = gets.chomp
employees = employees.to_i
x = 0
while x < employees
	puts "What is your name?"
	name = gets.chomp
	puts "How old are you?"
	age = gets.chomp
	age = age.to_i
	puts "What year were you born?"
	year = gets.chomp
	year = year.to_i
	puts "Should we order you some garlic bread? Enter 'yes' or 'no'"
	garlic = gets.chomp
	puts "Do you want to enroll in our company Health Insurance? Enter 'yes' or 'no'"
	health = gets.chomp
	puts "List any allergies and type 'done' when finished"
	allergies = nil
	until allergies == 'done' || allergies == 'sunshine'
		allergies = gets.chomp
		if allergies == 'sunshine'
			allergy = true
		end
	end

	if Time.new.year - age == year || Time.new.year - age == year + 1
		age_matches_year = true
	else
		age_matches_year = false
	end

	if age_matches_year == true && (garlic == "yes" || health === "yes")
		vampire_status = "Probably not a vampire."
	end
	if age_matches_year == false && (garlic == "no" || health == "no") || allergy == true
		vampire_status = "Probably a vampire."
	end
	if age_matches_year == false && garlic == "no" && health == "no"
		vampire_status = "Almost certainly a vampire."
	end
	if name.downcase == "drake cula" || name.downcase == "tu fang"
		vampire_status = "Definitely a vampire."
	end
	if vampire_status == nil
		vampire_status = "Results inconclusive."
	end

	puts vampire_status
	puts
	x+=1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends"