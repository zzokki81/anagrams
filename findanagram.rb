require_relative('lib/anagrams.rb')

dictionary, *input_word = ARGV
finder = Anagrams.new(dictionary)
input_word.uniq.each do |word|
anagram_result = finder.find_anagram(word)
   anagram_result.delete(word)
  if anagram_result.empty?
    puts("No anagrams found for word '#{word}'")
  else
    puts("Anagrams for given word '#{word}' is: ")
    puts((anagram_result * ' '))
  end
end
