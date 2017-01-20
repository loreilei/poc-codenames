#!/usr/bin/ruby
require 'colorize'
require 'colorized_string'


#Most of the coments are not useful, just repeatition of the puts

possible_words=[]
blue_picked_words=[]
red_picked_words=[]

#Initialise words, later should be picked from a dictionary
puts "Generating words..."
for i in 1..9
	possible_words<<"Word 0#{i}"
end
for i in 10..25
	possible_words<<"Word #{i}"
end

puts "Shuffling..."
possible_words.shuffle!
displayed_words=Array.new(possible_words)

#Picking death word
puts "Picking death word..."
death_word=possible_words.sample
possible_words.delete(death_word)

words_to_pick_for_blue=0
words_to_pick_for_red=0

#Selecting starter and set number of words to pick for each teams
puts "Selecting starter Team (Red or Blue?)..."
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
puts "Picking blue words..."
for i in 1..words_to_pick_for_blue
	picked_word=possible_words.sample 
	possible_words.delete(picked_word)
	blue_picked_words<<picked_word
end

#Picking red words
puts "Picking red words..."
for i in 1..words_to_pick_for_red
	picked_word=possible_words.sample
	possible_words.delete(picked_word)
	red_picked_words<<picked_word
end

#We display a grid showing all words and their characteristics (Blue, Red, Death)
if words_to_pick_for_blue==9
	puts "Starter team is #{ColorizedString["BLUE"].colorize(:color => :light_blue, :background => :blue)}"
else
	puts "Starter team is #{ColorizedString["RED"].colorize(:color => :light_red, :background => :red)}"
end
for i in 0..24
	word=displayed_words[i]
	ind="   "
	if blue_picked_words.include? word
		word=ColorizedString[word].colorize(:color => :light_blue, :background => :blue)
	elsif red_picked_words.include? word
		word=ColorizedString[word].colorize(:color => :light_red, :background => :red)
	elsif word==death_word
		word=ColorizedString[word].colorize(:color => :black, :background => :white)
	else
		word=ColorizedString[word].colorize(:color => :white, :background => :black)
	end
	print "#{word} "
	if (i+1)%5==0
		puts ""
	end
end
