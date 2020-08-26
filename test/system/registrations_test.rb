require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  def setup
    Rack::Test::UploadedFile.new(File.join(Rails.root, "test/fixtures/image.jpg"))
    @user = FactoryBot.create(:user5)
  end

  test "新規アカウントを登録する" do
    visit new_user_registration_path

    fill_in "名前", with: "sample"
    fill_in "Eメール", with: "sample@example.com"
    fill_in "パスワード", with: "123456"
    fill_in "パスワード（確認用）", with: "123456"
    fill_in "郵便番号", with: "123456"
    fill_in "住所", with: "Tokyo"
    fill_in "自己紹介", with: "Nice to meet you!"
    attach_file "ユーザー画像", "test/fixtures/image.jpg"
    click_on "アカウント登録"

    assert_text "アカウント登録が完了しました。"
  end

  test "ユーザープロフィールを表示する" do
    sign_in_as(@user)

    click_on "#{current_user.name}"
    assert_selector "h1", text: "#{current_user.name}さんのプロフィール"
  end

  test "ユーザープロフィールを編集する" do
    sign_in_as(@user)
    click_on "プロフィール編集"

    fill_in "名前", with: "sample"
    fill_in "Eメール", with: "sample@example.com"
    fill_in "パスワード", with: "654321"
    fill_in "パスワード（確認用）", with: "654321"
    fill_in "郵便番号", with: "123456"
    fill_in "住所", with: "Tokyo"
    fill_in "自己紹介", with: "Nice to meet you!"
    attach_file "ユーザー画像", "test/fixtures/image.jpg"
    click_on "更新"

    assert_text "アカウント情報を変更しました。"
  end

  test "アカウントを削除する" do
    sign_in_as(@user)
    click_on "プロフィール編集"
    page.accept_confirm do
      click_on "アカウント削除"
    end

    assert_current_path(new_user_session_path)
  end
end
