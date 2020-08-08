class Anagrams
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def group_anagrams
    anagram_group = {}
    read_file.group_by do |word|
      sorted_word = sort_and_validate(word)
      anagram_group[sorted_word] ||= []
      (anagram_group[sorted_word] << word)
    end
    anagram_group.values
  end

  def find_anagram(input_word)
    result = []
    word_characters = sort_and_validate(input_word)
    read_file.each do |word|
      result.push(word) if sort_and_validate(word) == word_characters
    end
    result
  end

  def to_s
    group_anagrams.each do |anagram_block|
      puts(anagram_block.join(' ')) if anagram_block.size > 1
    end.to_s
  end

  private

  def read_file
    if @dictionary.kind_of?(Array)
      @dictionary
    else
      File.read(@dictionary).encode('UTF-8', invalid: :replace, replace: '').split("\n")
    end
  end

  def sort_and_validate(word)
    word.downcase.split('').sort.join.gsub(/\W+/, '').strip
  end
end
