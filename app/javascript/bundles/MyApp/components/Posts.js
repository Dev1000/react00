import React, {useEffect, useState} from "react"
import axios from "axios"

import AddPost from "./Posts/AddPost"
import PostList from "./Posts/PostList"
import {getCSRF} from "./Utils/SomeFuncs"


const Posts = () => {
  const [posts, setPosts] = useState([])
  const [activePost, setActivePost] = useState(null)

  useEffect(() => {
    axios.get('/posts/index')
      .then(r => {
        console.log(r.data)
        setPosts(r.data)
      })
  }, [])

  const addPost = post => {
    console.log('addPost', post)
    if(post.title !== ''){
      axios.post('/posts', post, getCSRF())
        .then(r => {
          const post = r.data
          console.log(post)

          setPosts([post, ...posts])
        })
    }
  }

  const updateActivePost = post => {
    console.log('post:', post)
    setActivePost(post)
  }

  return (
    <React.Fragment>
      <div className='row'>
        <div className='col-sm-12'>
          <h1>Post</h1>
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-6'>
          <PostList posts={posts}
                    activePost={activePost}
                    updateActivePost={updateActivePost}/>
        </div>
        <div className='col-sm-6'>
          <AddPost addPost={addPost}
                   activePost={activePost}/>
        </div>
      </div>
    </React.Fragment>
  )
}

export default Posts