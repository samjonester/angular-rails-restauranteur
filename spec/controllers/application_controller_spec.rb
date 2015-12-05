require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :angular
      expect(response).to have_http_status(:success)
    end
  end

end
