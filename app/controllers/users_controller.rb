class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]

  def index
    users = User.all
    render json: users.to_json
  end

  def show
    user = User.find_by(id: params["id"])
    render json: user.to_json
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      games_won: 0,
      games_lost: 0,
    )
    if user.save
      render json: { message: "#{params[:first_name]} #{params[:last_name]}'s account successfully created" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    user = User.find_by(id: params["id"])
    if user
      user.first_name = params["first_name"] || user.first_name
      user.last_name = params["last_name"] || user.last_name
      user.email = params["email"] || user.email
      user.password = params["password"] || user.password

      if current_user.id == user.id
        user.save
        render json: user.as_json
      else
        render json: { message: "Must be signed in" }, status: 401
      end
    else
      render json: { message: "User does not exist" }, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params["id"])
    if user
      if current_user.id == user.id
        user.destroy
        render json: { message: "Successfully Deleted" }
      else
        render json: { message: "Must be signed in" }, status: 401
      end
    else
      render json: { message: "User does not exist" }, status: :bad_request
    end
  end
end
