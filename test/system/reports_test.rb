require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  def setup
    user = FactoryBot.create(:user)
    sign_in_as(user)
    @report = FactoryBot.create(:report, user: current_user, author: current_user.name)
    visit reports_path
  end

  test "日報を新規作成する" do
    click_on "新規作成"
    assert_current_path new_report_path

    fill_in "題名", with: "sample"
    select "2020", from: "report_date_1i"
    select "1月", from: "report_date_2i"
    select "1", from: "report_date_3i"
    fill_in "勉強時間", with: 1
    fill_in "内容", with: "sample"
    click_on "登録する"

    assert_text "登録しました"
    assert_current_path report_path(Report.find_by(title: "sample"))
  end

  test "日報の詳細を確認する" do
    click_on "詳細", match: :first
    assert_current_path report_path(@report)
  end

  test "日報の編集をする" do
    visit report_path(@report)
    click_on "日報編集", match: :smart
    assert_current_path edit_report_path(@report)

    fill_in "題名", with: "sample"
    select "2020", from: "report_date_1i"
    select "1月", from: "report_date_2i"
    select "1", from: "report_date_3i"
    fill_in "勉強時間", with: 1
    fill_in "内容", with: "sample"
    click_on "更新する"

    assert_text "更新しました"
    assert_current_path report_path(@report)
  end

  test "日報を削除する" do
    visit report_path(@report)
    page.accept_confirm do
      click_on "日報削除"
    end

    assert_text "削除しました"
    assert_current_path reports_path
  end
end
