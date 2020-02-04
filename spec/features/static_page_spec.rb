require 'rails_helper'
include ApplicationHelper

RSpec.feature "StaticPages", type: :feature do

  describe "#home" do
    before do
      visit root_path
    end

    describe "title" do
      it "Gathers : Homeになること" do
        expect(page).to have_title(full_title("Home"))
      end
    end
    describe "body" do

      it { expect(page).to have_css("h1", text: "発想を発信しよう") }

        describe "footer" do
          it {expect(page).to have_content "2020 Gathers by k.suzuki"}
        end
    end
  end

end
