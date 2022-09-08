import { useState, useEffect } from 'react';

const SubForm = ({ addSub, id, title, setEdit, updateSub }) => {
                              //  fields the obj has
  const [sub, setSub] = useState({ title: '' })

  useEffect( () => {
    // pre fill the form
    if (id) {
      // setSub({ title: title })
      setSub({ title })
    }
  }, [])

  const handleSubmit = (e) => {
    // not do a full page reload, and lose data and post in the url
    e.preventDefault()
    // see if we are doing a edit
    if (id) {
      updateSub(id, sub)
      setEdit(false)
    } else {
      addSub(sub)
    }
    // clear out the form 
    setSub({ title: '' })
  }

  return (
    <>
      <h2>{ id ? 'Edit' : 'Create' } Sub</h2>
      <form onSubmit={handleSubmit}>
        <label>Title</label>
        {/* 1 input for each attr */}
        <input 
          // main 3 things is name value and on change
          name='title'
          value={sub.title}
          onChange={(e) => setSub({ ...sub, title: e.target.value })}

          required
        />
        <button type='submit'>Submit</button>
      </form>
    </>
  )
}

export default SubForm;