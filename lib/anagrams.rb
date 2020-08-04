module FileReader
  def read_file(anagram_file)
    File.read(anagram_file).encode('UTF-8', invalid: :replace, replace: '').split("\n")
  end
end

class Anagrams
  include(FileReader)

  def show_anagrams(anagram_file)
    group_anagrams(anagram_file).each do |anagram_block|
      puts(anagram_block.join(' ')) if anagram_block.size > 1
    end
  end

  private

  def group_anagrams(anagram_file)
    read_file(anagram_file).group_by { |word| word.chars.sort.join }.values
  end
end

class SearchAnagrams
  include(FileReader)

  def initialize(input_word)
    @input_word = input_word
  end

  def find_anagram(anagram_file)
    result = []
    word_characters = @input_word.chars.to_a.sort.join
    read_file(anagram_file).each do |word|
      result.push(word) if word.chars.to_a.sort.join == word_characters
    end
    result
  end
end
