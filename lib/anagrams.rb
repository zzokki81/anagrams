class Anagrams
  def initialize(anagram_file)
    @anagram_file = anagram_file
  end

  def read_file
    File.read(@anagram_file).encode('UTF-8', invalid: :replace, replace: '').split("\n")
  end

  def group_anagrams
    read_file.group_by { |word| word.chars.sort }.values
  end

  def print_anagrams
    group_anagrams.each do |anagram_block|
      if anagram_block.size != 1
        puts anagram_block.join(' ')
      end
    end
  end
end
