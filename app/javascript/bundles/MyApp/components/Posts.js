import React, {useEffect, useState} from "react"
import axios from "axios"
import {gql} from "@apollo/client";
import {useQuery} from '@apollo/client'

import AddPost from "./Posts/AddPost"
import PostList from "./Posts/PostList"
import EditPost from "./Posts/EditPost"
import {getCSRF} from "./Utils/SomeFuncs"
import { withProvider } from "./Utils/GraphqlProvider"

const postsQuery = gql`
  query posts {
    posts {
      id
      title
    }
  }
`

const Posts = () => {
  const [posts, setPosts] = useState([])
  const [activePost, setActivePost] = useState(null)

  const {data, loading, error} = useQuery(postsQuery)
  if (loading) {
    return <span>Loading...</span>
  }

  /*useEffect(() => {
    axios.get('/posts/index')
      .then(r => {
        console.log(r.data)
        setPosts(r.data)
      })
  }, [])*/

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

  const updatePost = () => {
    console.log(activePost)
    axios.post('/post/' + activePost.id, activePost, getCSRF())
      .then(r => {
        const objDB = r.data
        //console.log('objDB:', objDB)
        const updatedPosts = posts.map(p => p.post.id === objDB.post.id ? objDB: p)
        //console.log('updatedPosts:', updatedPosts)
        setPosts(updatedPosts)
      })
  }

  const handleChange = event => {
    const name = event.target.name;
    const value = event.target.value;

    setActivePost({...activePost, [name]: value})
  }

  return (
    <React.Fragment>
      <div className='row'>
        <div className='col-sm-12'>
          <h1>Post</h1>
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-12'>
          <AddPost addPost={addPost}
                   activePost={activePost}/>
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-6'>
          <PostList posts={posts}
                    activePost={activePost}
                    updateActivePost={updateActivePost}/>
        </div>
        <div className='col-sm-6'>
          {
            activePost &&
            <EditPost post={activePost}
                      handleChange={handleChange}
                      updatePost={updatePost} />
          }
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-12'>
          {
            data.posts.map(post => {
              return (
                <p key={post.id}>{post.title}</p>
              )
            })
          }
        </div>
      </div>
    </React.Fragment>
  )
}

export default withProvider(Posts)