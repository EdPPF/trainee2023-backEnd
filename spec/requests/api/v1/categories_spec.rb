require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do

  describe "POST / create" do
    let(:categoryA) {create(:category, name:"NOME", description:"DESC")}
    let(:category_params) do
      attributes_for(:category)
    end

    context "when params are ok" do
      it "returns http status created" do
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:created)
      end
    end

    context "when params are nil" do
      category_params = nil
      it "returns http status bad_request" do
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "when params are repeated" do
      it "returns https status bad_request" do
        post "/api/v1/categories/create", params:{category: category_params}
        post "/api/v1/categories/create", params:{category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET / index" do
    before do
      create(:category, name:"Nomu", description:"Descript")
    end
    context "when category is created" do
      it "returns https status ok" do
        get "/api/v1/categories/index"
        expect(response).to have_http_status(:ok)
      end

      it "returns a JSON" do
        get "/api/v1/categories/index"
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "GET / show/:id" do
    let(:categoryB) {create(:category, name:"NomeB", description:"DescB")}
    let(:category_params) do
      attributes_for(:category)
    end

    context "when category exists" do
      it "returns http status ok" do
       get "/api/v1/categories/show/#{categoryB.id}", params:{category: category_params}
       expect(response).to have_http_status(:ok)
      end
    end

    context "when category doesn't exist" do
      it "returns http status not_found" do
        get "/api/v1/categories/show/52"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH / update/:id" do
    let(:categC) {create(:category, name:"NomC", description:"DescripC")}
    let(:categD) {create(:category, name:"NomD", description:"DescripD")}
    let(:category_params) do
      attributes_for(:category)
    end

    context "when params are ok" do
      it "returns http status ok" do
        patch "/api/v1/categories/update/#{categC.id}", params:{category: {name:"TotK", description:"Game of the Year"}}
        expect(response).to have_http_status(:ok)
      end
    end

    context "when params are nil" do
      it "returns https bad_request" do
        patch "/api/v1/categories/update/#{categC.id}", params:{category: {name:nil, description:nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE / delete/:id" do
    let(:categorY) {create(:category, name:"CY", description:"DnB")}

    context "when category exists" do
      it "returns http status ok" do
        delete "/api/v1/categories/delete/#{categorY.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "when post does not exist" do
      it "returns http status not_found" do
        delete "/api/v1/categories/delete/52"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

end
