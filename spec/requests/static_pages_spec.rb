require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    before do
      get root_path
    end

    it "success" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
      assert_select "title", full_title("Home")
    end
  end
end
