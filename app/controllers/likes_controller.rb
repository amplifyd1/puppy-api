class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: [:show, :destroy]

  def index
    json_response(@post.likes)
  end

  def show
    json_response(@like)
  end

  def create
    @post.likes.create!(like_params)
    json_response(@post, :created)
  end

  def destroy
    @like.destroy
    head :no_content
  end

  private

  def like_params
    params.permit(:liked_by)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find_by!(id: params[:id]) if @post
  end
end
