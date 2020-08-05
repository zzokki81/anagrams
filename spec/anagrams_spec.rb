require 'anagrams'

describe Anagrams do
  describe '.group_anagrams' do
    it 'Returns anagrams from a file: ' do
      anagram = Anagrams.new('AnagramFile.txt')
      expected_anagrams = [%w[spate tapes pates septa peats tepas paste],
                           %w[cuprites pictures crepitus piecrust], %w[undress sunders]]
      expect(anagram.group_anagrams).to eql expected_anagrams
    end

    it 'Returns anagrams from array: ' do
      anagram = Anagrams.new(%w[spate cuprites tapes pictures pates undress
                                septa crepitus peats piecrust sunders tepas paste])
      expected_anagrams = [%w[spate tapes pates septa peats tepas paste],
                           %w[cuprites pictures crepitus piecrust], %w[undress sunders]]
      expect(anagram.group_anagrams).to eql expected_anagrams
    end
  end
end
