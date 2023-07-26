require 'rails_helper'

RSpec.describe PostCategory, type: :model do

  context "Testing factory" do
    it "should not create PostCategory if not associated with a post" do
      create(:category, name:'cat1', description:'kajfj')
      expect(build(:post_category, category_id:1)).to be_invalid
    end

    it "should not create PostCategory if not associated with a category" do
      create(:post, title:'Tit1', content:'contnrsohgs')
      expect(build(:post_category, post_id:1)).to be_invalid
    end

    it "should create PostCategory" do
      create(:post, id:1, title:'tit2', content:'content 2')
      create(:category, id:1, name:'cat2', description:'desc 2')
      expect(build(:post_category, post_id:1, category_id:1)).to be_valid
    end
  end

end
