class TeamsController < ApplicationController
  def new
  	@tournament = Tournament.find(params[:tournament_id])
    @team = Team.new
    @team.tournament = @tournament
  end

  def create
  	@tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.new(params[:team])
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to @team
    else
      render 'edit'
    end
  end

  def index
  	@tournament = Team.find(params[:id]).tournament
    @teams = @tournament.teams
  end

  def show
  	@team = Team.find(params[:id])
  end

  def destroy
  	@tournament = Team.find(params[:id]).tournament
    Team.find(params[:id]).destroy
    redirect_to @tournament
  end

end
