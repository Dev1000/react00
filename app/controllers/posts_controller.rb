# frozen_string_literal: true

class PostsController < ApplicationController
  include PostsHelper

  def index
    posts_view = []

    posts = Post.where(user_id: current_user.id).order(created_at: :desc)
    posts.each do |post|
      posts_view.push(format_post_view(post))
    end

    render json: posts_view
  end

  def create
    post = current_user.posts.new(post_params)
    post.status = 'enabled'

    post.save!

    render json: format_post_view(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
