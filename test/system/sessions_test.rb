require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  def setup
    @user1 = FactoryBot.create(:user, :with_github)
    @user2 = FactoryBot.create(:user)
  end

  test "Basic認証でログインする" do
    sign_in_as(@user2)
    assert_text "ログインしました"
    assert_selector "h1", text: "登録本一覧"
    assert_current_path root_path
  end

  test "OAuth認証でログインする" do
    sign_in_with_oauth(@user1)
    assert_text "Github アカウントによる認証に成功しました。"
    assert_selector "h1", text: "登録本一覧"
    assert_current_path root_path
  end

  test "ログアウトする" do
    sign_in_as(@user2)
    click_on "ログアウト"
    assert_current_path new_user_session_path
  end
end
