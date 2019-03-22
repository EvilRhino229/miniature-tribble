class CommentsController < ApplicationController
  def create
    Comment.create(chirp_id: params[:chirp_id],
                   content: params[:content])
    redirect_to "/chirps/#{params[:chirp_id]}"
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    redirect_to "/chirps/#{params[:chirp_id]}"
  end
end
