class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

  def new

  end

  def create
    chirp = Chirp.new(content: params[:content])
    chirp.save
    flash[:success] = "Weird thing successfully shouted! (shouted? shaut?)"
    redirect_to "/chirps"
  end

  def edit
    @chirp = Chirp.find(params[:id])
  end

  def update
    chirp = Chirp.find(params[:id])
    chirp.update(content: params[:content])
    flash[:success] = "You took your words back. Something I can't do."
    redirect_to "/chirps/#{chirp.id}"
  end

  def destroy
    chirp = Chirp.find(params[:id])
    chirp.destroy
    flash[:error] = "You were good at Duck Hunt."
    redirect_to "/chirps"
  end
end