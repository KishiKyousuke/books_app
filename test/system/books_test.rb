require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    user = FactoryBot.create(:user)
    sign_in_as(user)
    @book = FactoryBot.create(:book, user: user, title: "title1")
  end

  test "登録本一覧を表示する" do
    visit books_url
    assert_selector "h1", text: "登録本一覧"
    assert_selector "tr>td", text: "title1"
    assert_current_path books_path
  end

  test "本を新規作成する" do
    visit books_url
    click_on "新規作成"
    assert_current_path new_book_path

    fill_in "題名", with: "title"
    fill_in "説明", with: "memo"
    fill_in "著者", with: "author"
    attach_file "画像", "test/fixtures/image.jpg"
    click_on "登録する"

    assert_text "登録しました"
    assert_current_path book_path Book.find_by(title: "title")
  end

  test "本の詳細を表示する" do
    visit books_url
    click_on "詳細", match: :first
    assert_current_path book_path(@book)
  end

  test "本の内容を更新する" do
    visit books_url
    click_on "編集", match: :prefer_exact
    assert_current_path edit_book_path(@book)

    fill_in "題名", with: @book.title
    fill_in "説明", with: @book.memo
    fill_in "著者", with: @book.author
    click_on "更新する"

    assert_text "更新しました"
    assert_current_path book_path(@book)
  end

  test "本を削除する" do
    visit books_url
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "削除しました"
    assert_current_path books_path
  end
end
