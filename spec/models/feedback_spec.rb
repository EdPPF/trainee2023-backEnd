require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context "Testing factory" do
    it "should not create Feedback if not associated with a Post" do
      expect(build(:feedback,like:true)).to be_invalid
    end

    it "should create Feedback" do
      create(:post, id:1, title:'Titulo bacana', content:'Conteudo do post bacana')
      expect(build(:feedback, post_id:1, like:true)).to be_valid
    end
  end
end
