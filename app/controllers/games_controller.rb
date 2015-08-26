class GamesController < ApplicationController
  def new
  	@tournament = Tournament.find(params[:tournament_id])
  	@game = Game.new
    @game.tournament = @tournament
  	@score = Array.new(2) { @game.scores.build } 
  end

  def create
  	@tournament = Tournament.find(params[:tournament_id])
    @game = @tournament.games.new(params[:game])
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @tournament = Game.find(params[:id]).tournament
    Game.find(params[:id]).destroy
    redirect_to @tournament
  end

  def edit
    @game = Game.find(params[:id])
    @tournament = @game.tournament
  end

  def update
    @game = Game.find(params[:id])
    @tournament = @game.tournament
    if (@game.update_attributes(params[:game]) && @game.update_attributes(params[:scores]))
      redirect_to @game
    else
      render 'edit'
    end
  end

end
