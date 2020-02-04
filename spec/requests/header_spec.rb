require 'rails_helper'

RSpec.describe "Headers", type: :request do
  describe "header's links" do
    it "have them" do
      get root_path
      assert_template "static_pages/home"
      assert_select "a[href=?]", root_path, count: 2

      pending "routeing作成次第"
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", signup_path
      assert_select "a[href=?]", users_path
      assert_select "a[href=?]", user_path
      assert_select "a[href=?]", logout_path
    end
  end
end
