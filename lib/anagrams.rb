class Anagrams
  def initialize(dictionary)
    @dictionary = dictionary
    @hash = Hash.new { |h, k| h[k] = [] }
    words_dictionary_list.group_by do |word|
      sorted_word = word_hash(word)
      @hash[sorted_word] ||= []
      @hash[sorted_word] << word
    end
  end

  def group_anagrams
    @hash.values
  end

  def find(input_word)
    sorted_word = word_hash(input_word)
    @hash[sorted_word]
  end

  def to_s
    @hash.values.each { |anagram_block| anagram_block.join(' ') }.to_s
  end

  private

  def words_dictionary_list
    if @dictionary.kind_of?(Array)
      @dictionary
    else
      @dictionary = File.read(@dictionary).encode('UTF-8', invalid: :replace, replace: '').split("\n")
    end rescue nil
  end

  def word_hash(word_key)
    word_key.downcase.split('').sort.join.gsub(/\W+/, '').strip
  end
end
