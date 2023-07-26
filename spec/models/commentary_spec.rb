require 'rails_helper'

RSpec.describe Commentary, type: :model do
  context "Testing factory" do
    it "should not create Commentary if not associated with a Post" do
      expect(build(:commentary, content:'acho massa')).to be_invalid
    end

    it "should create Commentary" do
      create(:post, id:1, title:'Titulo bacana', content:'Conteudo do post bacana')
      expect(build(:commentary, post_id:1, content:'acho bacana')).to be_valid
    end
  end

  context "Testing content" do
    it "should be invalid if content is nil" do
      create(:post, id:1, title:'Titulo bacana', content:'Conteudo do post bacana')
      expect(build(:commentary, post_id:1, content:nil)).to be_invalid
    end
  end
end
