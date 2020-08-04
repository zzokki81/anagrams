require_relative('lib/anagrams.rb')

text_file, *input_word = ARGV

input_word.each do |word|
  anagram = SearchAnagrams.new(word)
  anagram_result = anagram.find_anagram('AnagramFile.txt')
  if anagram_result == []
    puts("No anagrams found for word '#{word}'")
  else
    puts("Anagrams for given words '#{word}' is: ")
    puts((anagram_result * ' '))
  end
end
