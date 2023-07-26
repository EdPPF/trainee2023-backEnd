require 'rails_helper'

RSpec.describe "Api::V1::Feedbacks", type: :request do
  describe "POST / create" do
    before do
      create(:post, id: 1, title:"POSTE", content:"contente")
    end
    feedback_params = {like: true, post_id: 1}

    context "when params are ok" do
      it "return http status created" do
        post "/api/v1/feedbacks/create", params:{feedback: feedback_params}
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "GET / index" do
    before do
      create(:post, id: 2, title:"POSTE", content:"contente")
      create(:feedback, like: true, post_id: 2)
    end

    context "when feedback is created" do
      it "returns http status ok" do
        get "/api/v1/feedbacks/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/feedbacks/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET / show/:id" do
    before do
      create(:post, id: 2, title:"POSTE", content:"contente")
      create(:feedback, id: 1, like: true, post_id: 2)
    end

    context "when feedback exists" do
      it "returns http status ok" do
        get "/api/v1/feedbacks/show/1"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when post does not exist" do
      it "returns http status not_found" do
        get "/api/v1/feedbacks/show/-1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH / update/:id" do
    before do
      create(:post, id: 4, title:"POSTEb", content:"contenteB")
      create(:feedback, id: 2, like: false, post_id: 4)
    end

    context "when params are ok" do
      it "returns http status ok" do
        patch "/api/v1/feedbacks/update/2", params:{feedback: {like:true}}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE / delete/:id" do
    before do
      create(:post, id: 5, title:"POSTEc", content:"contenteC")
      create(:feedback, id: 3, like: true, post_id: 5)
    end

    context "when feedback exists" do
      it "returns http status ok" do
        delete "/api/v1/feedbacks/delete/3"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when feedback does not exist" do
      it "returns https status not_found" do
        delete "/api/v1/feedbacks/delete/-1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

end
