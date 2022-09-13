class TournamentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  # before_action :authenticate_admin, except: [:index, :show, :create]

  def index
    # puts "CURRENT USER: #{current_user.first_name}"
    tournament = Tournament.all

    # if params[:search]
    #   tournament = Tournament.where("zipcode ILIKE ?", "%#{params[:search]}%".to_i)
    # end

    render json: tournament.to_json
  end

  def show
    tournament = Tournament.find_by(id: params[:id])
    render json: tournament.as_json
  end

  def create
    tournament = Tournament.new(
      tournament_name: params[:tournament_name],
      date: params[:date],
      start_time: params[:start_time],
      street_address: params[:street_address],
      state: params[:state],
      city: params[:city],
      zipcode: params[:zipcode],
      details: params[:details],
      admin_user_id: current_user.id,
    )
    if tournament.save
      render json: tournament.as_json
    else
      render json: { errors: tournament.errors.full_messages }, status: :bad_request
    end
  end

  def update
    # puts "CURRENT USER: #{current_user.id}"
    tournament = Tournament.find_by(id: params[:id])
    tournament.tournament_name = params[:tournament_name] || tournament.tournament_name
    tournament.date = params[:date] || tournament.date
    tournament.start_time = params[:start_time] || tournament.start_time
    tournament.street_address = params[:street_address] || tournament.street_address
    tournament.state = params[:state] || tournament.state
    tournament.city = params[:city] || tournament.city
    tournament.zipcode = params[:zipcode] || tournament.zipcode
    tournament.details = params[:details] || tournament.details
    tournament.admin_user_id = params[:admin_user_id] || tournament.admin_user_id

    if tournament.save
      render json: tournament.as_json
    else
      render json: { errors: tournament.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    tournament = Tournament.find_by(id: params[:id])
    tournament.destroy
    render json: { message: "Tournament successfully Deleted" }
  end
end
