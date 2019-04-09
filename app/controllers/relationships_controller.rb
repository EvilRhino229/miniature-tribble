class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    relationship = Relationship.new(
                                    follower_id: current_user.id,
                                    followee_id: params[:followee_id]
                                                                     )
    if relationship.save
      followed_user_name = User.find(params[:followee_id]).first_name
      flash[:success] = "You're stalking #{followed_user_name}. Luckily, I'm not gonna tell the police. Yet."
      redirect_to "/users/#{params[:followee_id]}"
    else
      flash[:error] = "You're not stalking anyone. Paradoxically given this message, that's good I guess."
    end
  end

  def destroy
    relationship.destroy
  end
end
