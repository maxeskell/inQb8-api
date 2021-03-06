class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /ideas
  def index
    @ideas = Idea.all

    render json: @ideas, include: ['user', 'comments', 'tags']
  end

  # GET /ideas/1
  def show
    render json: @idea, include: ['user', 'comments', 'tags']
  end

  # POST /ideas
  def create
    @idea = Idea.new(Uploader.upload(idea_params))
    @idea.user = current_user

    if @idea.save
      render json: @idea, status: :created, location: @idea
    else
      render json: { errors: @idea.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(Uploader.upload(idea_params))
      render json: @idea, include: ['user', 'comments', 'tags']
    else
      render json: { errors: @idea.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.permit(:title, :pitch, :description, :image, :campaign_duration, :who_we_need, :benefits_for_you, :target, :user_id, :base64, love_ids: [], joiner_ids: [], tag_ids: [])
    end
end
