require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /profile_view" do
    it "returns http success" do
      get "/users/profile_view"
      expect(response).to have_http_status(:success)
    end
  end

end
