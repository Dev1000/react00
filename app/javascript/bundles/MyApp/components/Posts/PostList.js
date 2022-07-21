import React from "react"

const PostList = ({posts}) => {
  return (
    <div>
      {
        posts.map(post => <p key={post.id}>{post.title}</p>)
      }
    </div>
  )
}

export default PostList