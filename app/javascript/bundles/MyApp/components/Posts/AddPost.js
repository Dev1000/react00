import React, {useState} from "react";

const AddPost = (props) => {
  const [post, setPost] = useState({title: '', body: ''})

  const add = e => {
    e.preventDefault()
    console.log('Call to addPost')
    props.addPost(post)
  }

  const handleChange = event => {
    const name = event.target.name;
    const value = event.target.value;

    setPost({...post, [name]: value})
  }

  return (
    <form>
      <div className="mb-3">
        <label htmlFor="exampleInputEmail1" className="form-label">Title</label>
        <input name="title" type="text" onChange={handleChange} className="form-control" aria-describedby="emailHelp"/>
        <div id="emailHelp" className="form-text">We'll never share your email with anyone else.</div>
      </div>
      <div className="mb-3">
        <label htmlFor="exampleFormControlTextarea1" className="form-label">Body</label>
        <textarea name="body" onChange={handleChange} className="form-control" rows="3"/>
      </div>
      <button type="submit" onClick={add} className="btn btn-primary">Add Post</button>
    </form>
  )
}

export default AddPost