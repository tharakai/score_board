class TournamentsController < ApplicationController
  def new
  	@tournament = Tournament.new
  end

  def show
  	@tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      redirect_to @tournament
    else
      render 'new'
    end
  end
end
