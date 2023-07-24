require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it "should be valid" do
      expect(build(:category)).to be_valid
    end
  end

  context "Validating name" do
    it "should be invalid if name is nil" do
      expect(build(:category, name:nil)).to be_invalid
    end

    it "should be invalid if repeated" do
      create(:category, name: "Cat01")
      expect(build(:category, name: "Cat01")).to be_invalid
    end
  end

  context "Validating description" do
    it "should be invalid if description is nil" do
      expect(build(:category, description:nil)).to be_invalid
    end

    it "should be invalid if repeated" do
      create(:category, name: "Cat01", description: "Joguenhos")
    expect(build(:category, name: "Cat02" ,description: "Joguenhos")).to be_invalid
    end
  end
end
