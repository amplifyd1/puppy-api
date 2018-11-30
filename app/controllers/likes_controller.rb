class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: [:show, :destroy]

  def index
    json_response(@post.likes)
  end

  def show
    json_response([@like])
  end


#POST /posts/:post_id/likes/:id
  def create
    # current_user.@post.likes.create!(like_params)
    # json_response(@post, :created)
    @like = Like.new(like_params)
    @like.user = current_user
    @like.post = @post
    @like.save
    json_response(@like, :created)
  end

  def destroy
    @like.destroy
    head :no_content
  end

  private

  def like_params
    params.permit(:post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find_by!(id: params[:id]) if @post
  end
end
