class StandingsController < ApplicationController
  # before_action :authenticate_admin_edit_standing, except: [:index, :show, :create]

  def index
    # puts "PRINT CURRENT USER: #{current_user.id}"
    @standings = Standing.all
    # render json: standings.to_json
    render :index
  end

  def show
    @standing = Standing.find_by(id: params["id"])
    render :show
  end

  def create
    tournament = Tournament.find_by(id: params[:tournament_id])
    standing = Standing.new(
      tournament_id: params[:tournament_id],
      user_id: params[:user_id],
      round: params[:round],
      bracket_position: params[:bracket_position],

    )
    if current_user.id == tournament.admin_user_id
      if standing.save
        render json: { message: "Standing successfully created" }, status: :created
      else
        render json: { errors: standing.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "Must be an admin for tournament" }, status: 401
    end
  end

  def update
    standing = Standing.find_by(id: params["id"])
    standing.games_won = params["games_won"] || standing.games_won
    standing.games_lost = params["games_lost"] || standing.games_lost
    standing.bracket_position = params["bracket_position"] || standing.bracket_position

    if standing.save
      render json: standing.as_json
    else
      render json: { errors: standing.errors.full_messages }
    end
  end

  def destroy
    standing = Standing.find_by(id: params["id"])
    standing.destroy
    render json: { message: "Standing successfully Deleted" }
  end
end
