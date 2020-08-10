class RelationshipsController < ApplicationController
  def create
    current_user.active_relationships.create!(follower_id: params[:user_id])
    redirect_to users_path, notice: t("view.relationship.flash.follow")
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy!
    redirect_to users_path, notice: t("view.relationship.flash.unfollow")
  end
end
