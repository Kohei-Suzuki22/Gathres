require 'rails_helper'

RSpec.describe "UsersLogin", type: :request do
  before do
    get login_path
    expect(response).to have_http_status(200)
    expect(response).to be_success
    assert_template "sessions/new"
    assert_select "form[action='/login']"
  end
  describe "session" do
    it "login with invalid" do
      post login_path, params: {session:{
                                          email: "",
                                          password: ""
                                          }}
      assert_template "sessions/new"
      expect(flash).not_to be_empty
      get root_path
      expect(flash).to be_empty
    end
  end
end
