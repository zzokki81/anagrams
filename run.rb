require_relative 'lib/anagrams'

dictionary = ARGV[0]
anagrams = Anagrams.new(dictionary)
puts 'Collected anagrams is: '
puts anagrams.to_s
