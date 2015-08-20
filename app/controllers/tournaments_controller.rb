class TournamentsController < ApplicationController
  def new
  	@tournament = Tournament.new
  end

  def show
  	@tournament = Tournament.find(params[:id])
    @teams = @tournament.teams
  end

  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      redirect_to @tournament
    else
      render 'new'
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(params[:tournament])
      redirect_to @tournament
    else
      render 'edit'
    end
  end

  def index
    @tournaments = Tournament.all
  end

  def destroy
    Tournament.find(params[:id]).destroy
    redirect_to tournaments_url
  end

end
