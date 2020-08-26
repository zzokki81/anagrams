require("anagrams")

describe(Anagrams) do
  describe(".group_anagrams") do
    it("returns all the combinations of words that are anagrams from given file") do
      anagram = Anagrams.new("AnagramFile.txt")
      expected_anagrams = [["spate", "tapes", "pates", "septa", "peats", "tepas", "paste"], ["cuprites", "pictures", "crepitus", "piecrust"], ["undress", "sunders"]]
      expect(anagram.group_anagrams).to(eql(expected_anagrams))
    end

    it("returns all the combinations of words that are anagrams from given array") do
      anagram = Anagrams.new(["tapeS", "Abs", "pictures", "paste", "SBA", "Septa"])
      expected_anagrams = [["tapeS", "paste", "Septa"], ["Abs", "SBA"], ["pictures"]]
      expect(anagram.group_anagrams).to(eql(expected_anagrams))
    end
  end

  describe(".find")  do
    it("returns all words that are anagrams with the word 'paste' from given file ") do
      anagram = Anagrams.new("AnagramFile.txt")
      expected_anagrams = ["spate", "tapes", "pates", "septa", "peats", "tepas", "paste"]
      expect(anagram.find('paste')).to eql(expected_anagrams)
    end

    it("returns all words that are anagrams with the word 'Acts' from given array ") do
      anagram = Anagrams.new(["pictures", "ctas", "Stac", "spate", "Act's"])
      expected_anagrams = ["ctas", "Stac", "Act's"]
      expect(anagram.find('Acts')).to eql(expected_anagrams)
    end

    it("ignores everything except letters") do
      anagram = Anagrams.new([" abs", "'sba", "as'b", "a'b's"])
      expected_anagrams = [" abs", "'sba", "as'b", "a'b's"]
      expect(anagram.find("abs")).to eql(expected_anagrams)
    end

    it("ignores letter case") do
      anagram = Anagrams.new(["Abs", "ABS", "ASb", "abS"])
      expected_anagrams = ["Abs", "ABS", "ASb", "abS"]
      expect(anagram.find("abs")).to eql(expected_anagrams)
    end

     it("ignores words without anagram") do
      anagram = Anagrams.new(["stepa", "epasT", "tepas", "pictures", "ruby"])
      expected_anagrams = ["stepa", "epasT", "tepas"]
      expect(anagram.find("paste")).to eql(expected_anagrams)
    end
  end

  describe(".to_s") do
    it("returns strings from given array") do
      anagram = Anagrams.new(["pictures", "anagrams", "paste", "AB's"])
      expected_strings = "[[\"pictures\"], [\"anagrams\"], [\"paste\"], [\"AB's\"]]"
      expect(anagram.to_s).to eql(expected_strings)
    end
  end
end
