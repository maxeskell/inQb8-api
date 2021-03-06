class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :create]

  # GET /users
  def index
    @users = User.all

    render json: @users, include: ['ideas', 'comments', 'tags']
  end

  # GET /users/1
  def show
    render json: @user, include: ['ideas', 'comments', 'tags']
  end

  # POST /users
  def create
    @user = User.new(Uploader.upload(user_params))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(Uploader.upload(user_params))
      render json: @user, include: ['ideas', 'comments', 'tags']
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:first_name, :last_name, :username, :email, :image, :github_id, :facebook_id, :base64, ideas_loved_ids: [], ideas_joined_ids: [])
    end
end
