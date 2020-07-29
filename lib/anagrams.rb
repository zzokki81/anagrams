class Anagrams
  def initialize(anagram_file)
    @anagram_file = anagram_file
  end

  def show_anagrams
    group_anagrams.each do |anagram_block|
      puts anagram_block.join(' ') if anagram_block.size > 1
    end
  end

  def find_anagram(input_word)
    result = []
    word_characters = input_word.chars.to_a.sort.join
    read_file.each do |word|
      result.push(word) if word.chars.to_a.sort.join == word_characters
    end
    result
  end

  private
  def group_anagrams
    read_file.group_by { |word| word.chars.sort.join }.values
  end

  def read_file
    File.read(@anagram_file).encode('UTF-8', invalid: :replace, replace: '').split("\n")
  end
end
