require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    OmniAuth.config.test_mode = true
    @omniauth_auth = OmniAuth.config.add_mock(
      :github,
        uid: "12345678",
        info: {
            email: "tarou@example.com",
            name: "Tarou Yamada",
        }
    )
  end

  test "#find_for_github_oauth ユーザーが存在しなければ、ユーザーを作成する" do
    assert_difference "User.count" do
      User.find_for_github_oauth(@omniauth_auth)
    end
  end

  test "#find_for_github_oauth 既にユーザーが存在すれば、そのレコードを返す" do
    user = FactoryBot.create(:user, :with_github, uid: "12345678", email: "tarou@example.com")
    assert_equal(user, User.find_for_github_oauth(@omniauth_auth))
  end

  test "#create_unique_string ランダムなIDを生成する" do
    first_id = User.create_unique_string
    second_id = User.create_unique_string
    assert_not_equal(first_id, second_id)
  end

  test "#followed_by? 引数のユーザーにフォローされていれば真を返す" do
    relationship = FactoryBot.create(:relationship)
    user1 = relationship.following
    user2 = relationship.follower
    assert(user2.followed_by?(user1))
  end

  test "#followed_by? 引数のユーザーにフォローされていなければ偽を返す" do
    relationship = FactoryBot.create(:relationship)
    user1 = relationship.follower
    user2 = FactoryBot.create(:user)
    assert_not(user2.followed_by?(user1))
  end
end
