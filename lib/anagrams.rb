class Anagrams
  def initialize(anagram_file)
    @anagram_file = anagram_file
  end

  def group_anagrams
    anagram_group = {}
    read_file.group_by do |word|
      sorted_word = word.chars.sort.join
      anagram_group[sorted_word] ||= []
      (anagram_group[sorted_word] << word)
    end
    anagram_group.values
  end

  def find_anagram(input_word)
    result = []
    word_characters = input_word.chars.to_a.sort.join
    read_file.each do |word|
      result.push(word) if word.chars.to_a.sort.join == word_characters
    end
    result
  end

  def to_string
    group_anagrams.each do |anagram_block|
      puts anagram_block.join(' ') if anagram_block.size > 1
    end.to_s
  end

  def read_file
    if @anagram_file.kind_of?(Array)
      @anagram_file
    else
      File.read(@anagram_file).encode('UTF-8', invalid: :replace, replace: '').split("\n")
    end
  end
end
