require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  def setup
    user1 = FactoryBot.create(:user)
    sign_in_as(user1)
    @user2 = FactoryBot.create(:user)
    @book = FactoryBot.create(:book, user: @user2)
    @comment = FactoryBot.create(:comment, user: current_user, author: current_user.name, commentable: @book)
  end

  test "本にコメントする" do
    visit book_path(@book)
    click_on "コメントする"
    assert_current_path new_book_comment_path(book_id: @book)

    fill_in "コメント内容", with: "sample"
    click_on "登録する"

    assert_text "登録しました"
    assert_current_path book_path(@book)
  end

  test "日報にコメントする" do
    report = FactoryBot.create(:report, user: @user2, author: @user2.name)
    visit report_path(report)
    click_on "コメントする"
    assert_current_path new_report_comment_path(report_id: report)

    fill_in "コメント内容", with: "sample"
    click_on "登録する"

    assert_text "登録しました"
    assert_current_path report_path(report)
  end

  test "コメントを編集する" do
    visit book_path(@book)
    click_on "編集", match: :prefer_exact
    assert_current_path edit_book_comment_path(@book, @comment)

    fill_in "コメント内容", with: "sample"
    click_on "更新する"

    assert_text "更新しました"
    assert_current_path book_path(@book)
  end

  test "コメントを削除する" do
    visit book_path(@book)
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "削除しました"
    assert_current_path book_path(@book)
  end
end
