=begin
module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words.upcase + "!" + " :)"
	end
end

p Shout.yell_angrily("I'm mad")
p Shout.yelling_happily ("i'm so happy today")
=end

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yelling_happily(words)
		words.upcase + "!" + " :)"
	end
end

class Child
	include Shout
end

class Baby
	include Shout
end

child = Child.new
p child.yell_angrily "That's mine"
p child.yelling_happily "It's my birthday!"

baby = Baby.new
p baby.yelling_happily "deiowjeijegwpijog"
p baby.yell_angrily "I'm hungry, where's my bottle?"