require 'rails_helper'

RSpec.feature "Footers", type: :feature do

  before do
    visit root_path
  end

  describe "footer" do
    it {expect(page).to have_content "2020 Gathers by k.suzuki"}
  end
end
