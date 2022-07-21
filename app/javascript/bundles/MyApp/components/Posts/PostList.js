import React from "react"

const PostList = ({posts, activePost, updateActivePost}) => {
  return (
    <table className='table'>
      <thead>
      <tr>
        <th>Name</th><th>Author</th><th>Tags</th>
      </tr>

      </thead>
      <tbody>
      {
        posts.map(obj => {
          const activePostClass = activePost && activePost.id === obj.post.id ? 'table-primary' : ''

          return (
            <tr key={obj.post.id} onClick={() => updateActivePost(obj.post)}
                className={activePostClass} style={{cursor: 'pointer'}}>
              <td>{obj.post.title}</td>
              <td>{obj.post.user_id}</td>
              <td>
                {obj.tags.map(tag => <span key={tag.id} className='badge bg-primary' style={{marginRight: '5px'}}>{tag.name}</span>)}
              </td>
            </tr>
          )
        })
      }
      </tbody>
    </table>
  )
}

export default PostList