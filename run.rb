require_relative 'lib/anagrams'

text_file = ARGV[0]
anagram = Anagrams.new
puts 'Collected anagrams: '
anagram.show_anagrams(text_file)
