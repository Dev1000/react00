import React, {useEffect, useState} from "react"

const EditPost = ({post, handleChange, updatePost}) => {
  const update = event => {
    event.preventDefault()

    updatePost()
  }
  return (
    <React.Fragment>
      <h3>Update</h3>
      <form>
        <div className='row'>
          <div className="col mb-3">
            <label htmlFor="exampleInputEmail1" className="form-label">Title</label>
            <input name="title" type="text" onChange={handleChange} value={post.title}
                   className="form-control" aria-describedby="emailHelp"/>
          </div>
          <div className="col mb-3">
            <label htmlFor="exampleFormControlTextarea1" className="form-label">Body</label>
            <textarea name="body" onChange={handleChange} value={post.body}
                      className="form-control" rows="3"/>
          </div>
        </div>

        <button type="submit" onClick={update} className="btn btn-primary">Update Post</button>
      </form>
    </React.Fragment>
  )
}

export default EditPost