import React, {useState} from "react";

const AddPost = (props) => {
  const [post, setPost] = useState({title: '', body: ''})

  const add = event => {
    event.preventDefault()
    props.addPost(post)

    setPost({title: '', body: ''})
  }

  const handleChange = event => {
    const name = event.target.name;
    const value = event.target.value;

    setPost({...post, [name]: value})
  }

  return (
    <form>
      <div className='row'>
        <div className="col mb-3">
          <label htmlFor="exampleInputEmail1" className="form-label">Title</label>
          <input name="title" type="text" onChange={handleChange} value={post.title}
                 className="form-control" aria-describedby="emailHelp"/>
        </div>
        <div className="col mb-3">
          <label htmlFor="exampleFormControlTextarea1" className="form-label">Body</label>
          <textarea name="body" onChange={handleChange} value={post.body} className="form-control" rows="3"/>
        </div>
      </div>

      <button type="submit" onClick={add} className="btn btn-primary">Add Post</button>
    </form>
  )
}

export default AddPost