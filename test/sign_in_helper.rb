module SignInHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_on "ログイン"
    @current_user = user
  end

  def sign_in_with_oauth(user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      user.provider,
        uid: user.uid,
        info: {
            email: user.email,
            name: user.name
        }
    )

    visit new_user_session_path
    click_on "GitHubでログイン"
    @current_user = user
  end

  def current_user
    @current_user
  end
end
