require_relative 'lib/anagrams'

input_word = ARGV[0]
text_file = ARGV[1]

anagram = Anagrams.new(text_file)
anagram_result = anagram.find_anagram(input_word)
if anagram_result == []
  puts "No anagrams found for word '#{input_word}'"
else
  puts "Anagrams for given word '#{input_word}' is: "
  puts anagram_result * ' '
end
