require_relative 'lib/anagrams'

text_file = ARGV[0]
anagram = Anagrams.new(text_file)
puts 'Collected anagrams is: '
anagram.to_string
