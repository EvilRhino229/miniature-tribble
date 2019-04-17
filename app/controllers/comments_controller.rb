class CommentsController < ApplicationController

  # before_action :authenticate_user!, only: [:create, :destroy]
  #   def authenticate_admin!
  #     if current_user.admin? == false
  #       flash[:error] = "You must be an admin in order to access that!"
  #       redirect_to “/”
  #     end
  #   end
  def create
    @comment = Comment.new(chirp_id: params[:chirp_id],
                              content: params[:content],
                              user_id: current_user.id
                              )

    if @comment.save
      flash[:success] = "Successfully just shouted at someone online. Nice."
      redirect_to "/chirps/#{params[:chirp_id]}"
    else
      @chirp = Chirp.find(params[:chirp_id])
      render "chirps/show"
    end
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    flash[:error] = "You regretted what you just said."
    redirect_to "/chirps/#{params[:chirp_id]}"
  end
end
