class ChirpsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
    @comment = Comment.new
  end

  def new
    @chirp = Chirp.new
  end

  def create
    @chirp = Chirp.new(content: params[:content])
    if @chirp.save
      flash[:success] = "Weird thing successfully shouted! (shouted? shaut?)"
      redirect_to "/chirps"
    else
      flash[:error] = "idiot, it's WRONG"
      render 'new'
    end
  end

  def edit
    @chirp = Chirp.find(params[:id])
  end

  def update
    @chirp = Chirp.find(params[:id]) 

    if @chirp.update(content: params[:content])
      flash[:success] = "You changed the record of what you've previously said in the past. But I remember. Je me souviens."
      redirect_to "/chirps/#{@chirp.id}"
    else
      render 'edit'
    end
  end

  def destroy
    chirp = Chirp.find(params[:id])
    chirp.destroy
    flash[:error] = "You were good at Duck Hunt."
    redirect_to "/chirps"
  end
end