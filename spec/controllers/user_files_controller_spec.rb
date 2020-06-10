# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserFilesController, type: :controller do
  describe "GET #index" do
    before do
      @users = create_list(:user, 10)
    end

    it "レスポンスに成功すること" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "zip形式のデータが返ってくること" do
      get :index
      binding.pry
      expect(response["Content-Type"]).to eq "application/zip"
    end
  end
end
