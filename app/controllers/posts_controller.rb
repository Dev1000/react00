# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    post.status = 'enabled'

    post.save!

    render json: post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
