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
      describe "画面の表示" do
        describe "header" do
          it { expect(page).to have_content "新規ユーザー"}
          it { expect(page).to have_content "ログイン" }
          it { expect(page).to have_content "ユーザー"}
          it { expect(page).to have_content "マイアカウント"}
          it { expect(page).to have_content "プロフィール"}
          it { expect(page).to have_content "ログアウト"}
        end

        describe "contents" do
          it { expect(page).to have_css("h1", text: "発想を発信しよう") }
        end

        describe "footer" do
          it {expect(page).to have_content "2020 Gathers by k.suzuki"}
        end
      end

    end
  end

end
