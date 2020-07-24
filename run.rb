require_relative 'lib/anagrams'

text_file = ARGV[0]
anagram = Anagrams.new(text_file)
puts 'Collected anagrams: '
anagram.print_anagrams
