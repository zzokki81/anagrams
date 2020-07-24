require 'anagrams'

describe Anagrams do
  describe '.group_anagrams' do
    it "returns all anagrams from a file" do
      anagram = Anagrams.new("AnagramFile.txt")
      expect(anagram.group_anagrams).to eql([["spate", "tapes", "pates", "septa", "peats", "tepas", "paste"], ["cuprites", "pictures", "crepitus", "piecrust"], ["undress", "sunders"]])
    end
  end
end
