module PostsHelper
  def format_post_view(post)
    { post: post, tags: post.tags, comments: post.comments }
  end
end
