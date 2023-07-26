require 'rails_helper'

RSpec.describe "Api::V1::Commentaries", type: :request do

  describe "POST / create" do
    before do
      create(:post, id: 1, title:"Titulo1", content:"Conteudo1")
      #create(:commentary, content:"McDonalds", user_id:20, post_id:1)
    end
    let(:commentary_params) do
      attributes_for(:commentary)
    end

    context "when params are ok" do
      commentary_params = {post_id: 1, content:"AA"}
      it "return http status created" do
        post "/api/v1/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      commentary_params = nil
      it "return http status bad_request" do
        post "/api/v1/commentaries/create", params:{commentary: commentary_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET / index" do
    before do
      create(:post, id: 2, title:"TituloA", content:"ConteudoA")
      create(:commentary, content:"McDonalds", post_id:2)
    end
    context "when comment is created" do
      it "returns https status ok" do
        get "/api/v1/commentaries/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/commentaries/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET / show/:id" do
    before do
      create(:post, id: 3, title:"._.", content:"conteudo")
      create(:commentary, id: 5, content: "cont", post_id: 3)
    end

    context "when comment exists" do
      it "returns http status ok" do
        get "/api/v1/commentaries/show/5"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when comment does not exist" do
      it "returns http status not_found" do
        get "/api/v1/commentaries/show/-1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH / update/:id" do
    before do
      create(:post, id: 4, title:"POSTEb", content:"contenteB")
      create(:commentary, id: 10, content: "2as4", post_id: 4)
    end

    context "when params are ok" do
      it "returns http status ok" do
        patch "/api/v1/commentaries/update/10", params:{commentary: {content:"4as6"}}
        expect(response).to have_http_status(:ok)
      end
    end

    context "when params are nil" do
      it "returns http status bad_request" do
        patch "/api/v1/commentaries/update/10", params:{commentary: {content:nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE / delete/:id" do
    before do
      create(:post, id: 5, title:"How to Play Sekiro", content:"gameplay.mp4")
      create(:commentary, id: 15, content: "very cool", post_id: 5)
    end

    context "when comment exists" do
      it "returns http status ok" do
        delete "/api/v1/commentaries/delete/15"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when comment does not exist" do
      it "returns https status not_found" do
        delete "/api/v1/commentaries/delete/-1"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

end
