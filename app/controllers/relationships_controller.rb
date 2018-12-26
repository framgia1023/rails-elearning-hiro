class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.create_activity(user_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.destroy
    current_user.unfollow(user)
    redirect_to request.referer
  end
end
