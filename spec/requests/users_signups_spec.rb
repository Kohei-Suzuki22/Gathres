require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "post signup with invalid" do
    it "show errors" do
      get signup_path
      expect(response).to have_http_status(200)
      expect(response).to be_success
      assert_select "form[action='/signup']"
      assert_select "form[action='/users']", count: 0
      expect{
        post signup_path, params: { user: {
          name:"",
          email: "user@invalid",
          password: "pass",
          password: "word"
          } }
       }.to change(User, :count).by(0)
      assert_template "users/new"
      assert_template "shared/_error_messages"
      assert_select "div.alert.alert-danger"
      assert_select "div#error_explanation"
      assert_select "div.field_with_errors", count: 6
    end
  end
end
