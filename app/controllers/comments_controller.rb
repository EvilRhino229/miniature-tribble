class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    Comment.create(chirp_id: params[:chirp_id],
                   content: params[:content])
    flash[:success] = "Successfully just shouted at someone online. Nice."
    redirect_to "/chirps/#{params[:chirp_id]}"
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    flash[:error] = "You regretted what you just said."
    redirect_to "/chirps/#{params[:chirp_id]}"
  end
end
