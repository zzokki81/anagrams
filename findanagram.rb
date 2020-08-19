require_relative("lib/anagrams.rb")

dictionary_filename, *input_word = ARGV
begin
  anagrams = Anagrams.new(dictionary_filename)
  input_word.uniq.each do |given_word|
    anagram_result = anagrams.find(given_word)
    anagram_result.delete(given_word)
    if anagram_result.empty?
      puts("No anagrams found for word '#{given_word}'")
    else
      puts("Anagrams for given word '#{given_word}' is: ")
      puts anagram_result
    end
  end
rescue
  puts "File '#{dictionary_filename}' does not exists"
end
