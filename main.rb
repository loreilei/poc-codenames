#!/usr/bin/ruby

#Most of the coments are not useful, just repeatition of the puts

possible_words=[]
blue_picked_words=[]
red_picked_words=[]

#Initialise words, later should be picked from a dictionary
puts "Generating words"
for i in 1..25
	possible_words<<"Word #{i}"
end

puts "Shuffling"
possible_words.shuffle!

#Picking death word
puts "Picking death word"
death_word=possible_words.sample

words_to_pick_for_blue=0
words_to_pick_for_red=0

#Selecting starter and set number of words to pick for each teams
puts "Selecting starter Team (Red or Blue?)"
if(rand(0..1)==0)
	puts "Starter Team is Red!"
	words_to_pick_for_blue=8
	words_to_pick_for_red=9
else
	puts "Starter Team is Blue!"
	words_to_pick_for_blue=9
	words_to_pick_for_red=8
end

#Picking blue words
puts "Picking blue words"
for i in 0..words_to_pick_for_blue
	picked_word=possible_words.sample
	if picked_word==death_word or blue_picked_words.include? picked_word then
      redo
	end
	blue_picked_words<<picked_word
end

#Picking red words
puts "Picking red words"
for i in 0..words_to_pick_for_red
	picked_word=possible_words.sample
	if picked_word==death_word or red_picked_words.include? picked_word then
      redo
	end
	red_picked_words<<picked_word
end

#We display a grid showing all words and their characteristics (Blue, Red, Death)
for i in 0..24
	word=possible_words[i]
	ind="   "
	if blue_picked_words.include? word
		ind="(B)"
	elsif red_picked_words.include? word
		ind="(R)"
	elsif word==death_word
		ind="(D)"
	else
		ind="(N)"
	end
	print "#{word} #{ind}\t"
	if (i+1)%5==0
		puts ""
	end
end
