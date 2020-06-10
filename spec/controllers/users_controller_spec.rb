# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    before do
      @users = create_list(:user, 10)
    end

    it "レスポンスに成功すること" do
      get :index
      expect(response).to be_successful
    end

    it "正しいテンプレートを返していること" do
      get :index
      expect(response).to render_template :index
    end

    it "formatがcsvの場合に、csv形式のファイルが返ってくること" do
      get :index, params: { format: :csv }
      expect(response).to render_template :index
      expect(response["Content-Type"]).to eq "text/csv"
    end
  end

  describe "GET #index:csv" do
    render_views
    before do
      @users = create_list(:user, 10)
    end

    it "レスポンスに成功すること" do
      get :index, params: { format: :csv }
      expect(response).to be_successful
    end

    it "CSVの中身が正しいこと" do
      get :index, params: { format: :csv }
      expect(response).to render_template :index
      expect(response["Content-Type"]).to eq "text/csv"
      csv_data = CSV.parse(response.body)
      expect(csv_data.count).to eq @users.count + 1
      expect(csv_data[0]).to eq ["name", "age", "gender", "created_at"]
      expect(csv_data[1][0]).to eq @users.first.name
      expect(csv_data[-1][0]).to eq @users.last.name
    end
  end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     user = User.create! valid_attributes
  #     get :show, params: {id: user.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     user = User.create! valid_attributes
  #     get :edit, params: {id: user.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, params: {user: valid_attributes}, session: valid_session
  #       }.to change(User, :count).by(1)
  #     end

  #     it "redirects to the created user" do
  #       post :create, params: {user: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(User.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {user: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(user)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: user.to_param}, session: valid_session
  #     }.to change(User, :count).by(-1)
  #   end

  #   it "redirects to the users list" do
  #     user = User.create! valid_attributes
  #     delete :destroy, params: {id: user.to_param}, session: valid_session
  #     expect(response).to redirect_to(users_url)
  #   end
  # end
end
