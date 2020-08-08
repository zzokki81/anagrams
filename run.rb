require_relative 'lib/anagrams'

dictionary = ARGV[0]
anagram = Anagrams.new(dictionary)
puts 'Collected anagrams is: '
anagram.to_s
