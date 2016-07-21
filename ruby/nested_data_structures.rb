# city, neighborhood, school, students

city = {
	"Downtown" => {
		"Name" => "Downtown",
		"Schools" => [
			"Washington Elementary School",
			"Lincoln High School"
			],
		"Population" => "23,650"
		},
	
	"Financial_District" => {
		"Name" => "Financial_District",
		"Schools" => [
			"Adams High School",
			"Kennedy University"
			],
		"Population" => "12,046"
		},
	"Historical_District" => {
		"Name" => "Historical_District",
		"Schools" => [
			"Jefferson Community College"
			],
		"Population" => "13,501"
		},
	"Suburbs" => {
		"Name" => "Suburbs",
		"Schools" => [
			"Jackson Elementary School",
			"Chester A. Arthur Elementary School",
			"Madison High School"
			],
		"Population" => "33,204"
		}
}

puts city["Downtown"]["Schools"][0]
puts city["Suburbs"]["Schools"][1]
puts
puts "The population in the suburbs = #{city["Suburbs"]["Population"]}"

# Adding a school to the Historical District
city["Historical_District"]["Schools"].push("Roosevelt University")
puts city["Historical_District"]["Schools"]