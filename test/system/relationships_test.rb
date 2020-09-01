require "application_system_test_case"

class RelationshipsTest < ApplicationSystemTestCase
  def setup
    relationship = FactoryBot.create(:relationship)
    user = relationship.following
    sign_in_as(user)
  end

  test "ユーザーをフォローする" do
    FactoryBot.create(:user)
    click_on "ユーザー一覧"

    click_on "フォローする"
    assert_text "フォローしました"
    assert_current_path users_path
  end

  test "ユーザーのフォローを解除する" do
    click_on "ユーザー一覧"

    click_on "フォロー済"
    assert_text "フォローを解除しました"
    assert_current_path users_path
  end
end
