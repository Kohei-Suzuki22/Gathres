require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do

  describe "#home" do
    before do
      visit root_path
    end

    describe "title" do
      it { expect(page).to have_title(full_title("Home"))}
    end
    describe "body" do
      it { expect(page).to have_css("h1", text: "発想を発信しよう") }
    end
  end

end
