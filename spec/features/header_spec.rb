require 'rails_helper'

RSpec.feature "Headers", type: :feature do
  before do
    visit root_path
  end

  describe "header" do
    it { expect(page).to have_content "新規ユーザー"}
    it { expect(page).to have_content "ログイン" }
    it { expect(page).to have_content "ユーザー"}
    it { expect(page).to have_content "マイアカウント"}
    it { expect(page).to have_content "プロフィール"}
    it { expect(page).to have_content "ログアウト"}
  end
end
