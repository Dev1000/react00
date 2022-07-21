import React, {useState} from "react"
import AddPost from "./Posts/AddPost"
import axios from "axios";
import {getCSRF} from "./Utils/SomeFuncs";
import PostList from "./Posts/PostList";

const Posts = () => {
  const [posts, setPosts] = useState([])

  const addPost = post => {
    console.log('addPost', post)
    if(post.title !== ''){
      axios.post('/posts', post, getCSRF())
        .then(r => {
          const post = r.data
          console.log(post)
          setPosts([...posts, post])
        })
    }
  }

  return (
    <React.Fragment>
      <h1>Post</h1>
      <AddPost addPost={addPost}/>
      <PostList posts={posts} />
    </React.Fragment>

  )
}

export default Posts