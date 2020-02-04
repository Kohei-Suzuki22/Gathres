require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "get new" do
    before do
      get signup_path
    end
    it {expect(response).to have_http_status(200)}
    it {expect(response).to be_success}
    it {assert_select "title", full_title("Signup")}
  end
end
