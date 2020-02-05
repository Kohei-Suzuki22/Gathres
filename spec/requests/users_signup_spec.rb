require 'rails_helper'

RSpec.describe "UsersSignup", type: :request do
  before do
    get signup_path
    expect(response).to have_http_status(200)
    expect(response).to be_success
    assert_select "form[action='/signup']"
    assert_select "form[action='/users']", count: 0
  end
  describe "signup with invalid" do
    it "shows errors" do
      expect{
        post signup_path, params: { user: {
                                          name:"",
                                          email: "user@invalid",
                                          password: "pass",
                                          password: "word"
                                          }}
       }.to change(User, :count).by(0)
      assert_template "users/new"
      assert_template "shared/_error_messages"
      assert_select "div.alert.alert-danger"
      assert_select "div#error_explanation"
      assert_select "div.field_with_errors", count: 6
    end
  end

  describe "signup with valid" do
    it "shows success" do
      expect{
        post signup_path, params: {user: {
          name: "user",
          email: "user@example.com",
          password: "password",
          password_confirmation: "password"
          }}
        }.to change(User,:count).by(1)
        expect(response).to have_http_status(302)
        follow_redirect!
        assert_template "users/show"
        assert_template "layouts/_flash_messages"
        expect(flash).not_to be_empty
        assert_select "div.alert.alert-success", text: "ようこそ!"
    end

  end
end
