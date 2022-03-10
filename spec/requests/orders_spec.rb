require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/orders/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/orders/create"
      expect(response).to have_http_status(:success)
    end
  end

end
