require './enumerable'

describe Enumerable do
  describe "#my_each" do
    it "Loops through each element in the right order" do
      answer = []
      test = [1, 2, 3, 4]
      test.my_each {|x| answer << x * 3}
      expect(answer).to eql([3, 6, 9, 12])
    end
  end

  describe "#my_select" do
    it "selects the right values out of array" do
      answer = []
      test = [3, 6, 9, 12]
      test.my_select {|x| answer << x if x > 7}
      expect(answer).to eql([9,12])
    end
  end

  describe "#my_each_with_index" do
    it "displays the index" do
      answer = []
      test = [3, 6, 9, 12]
      test.my_each_with_index {|x, index| answer << index if x > 9}
      expect(answer).to eql([3])
    end
  end

  describe "#my_any?" do
    it "should return true" do
      test = [3, 6, 9, 12]
      answer = test.my_any? {|x| x == 9}
      expect(answer).to eql(true)
    end

    it "should return false" do
      test = [3, 6, 9, 12]
      answer = test.my_any? {|x| x == 50}
      expect(answer).to eql(false)
    end
  end

  describe "#my_all?" do
    it "should return true" do
      test = [3, 6, 9, 12]
      answer = test.my_all? {|x| x > 2}
      expect(answer).to eql(true)
    end

    it "should return false" do
      test = [3, 6, 9, 12]
      answer = test.my_all? {|x| x > 3}
      expect(answer).to eql(false)
    end
  end

  describe "my_none?" do
    it "should return true" do
      test = [3, 6, 9, 12]
      answer = test.my_none? {|x| x == 1}
      expect(answer).to eql(true)
    end

    it "should return false" do
      test = [3, 6, 9, 12]
      answer = test.my_none? {|x| x == 3}
      expect(answer).to eql(false)
    end
  end
end