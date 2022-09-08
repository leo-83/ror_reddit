import { useState, useEffect } from 'react';
import axios from 'axios';
import SubList from './SubList';
import SubForm from './SubForm';

// this is where all the CRUD are in the front end 
const Subs = () => {
  // where we are storing all the subs in the front end
  const [subs, setSubs] = useState([])

  // this will run before we display to the page
  useEffect( () => {
    // http verb and url 
    // subs index action
    // res -> all of your subs from your db
    axios.get('/api/subs')
      .then( res => setSubs(res.data) ) // storing all the subs from the db to the component state
      .catch( err => console.log(err) )
  }, [])

  // add function with a post request and http
  const addSub = (sub) => {
    // create it in the back via the routes and controller
    axios.post('/api/subs', { sub })
      .then( res => setSubs([...subs, res.data])) // adding to the front end
      .catch( err => console.log(err) )
  }

  const updateSub = (id, sub) => {
    // update in the back end
    axios.put(`/api/subs/${id}`, { sub })
      .then( res => {
        // update in the front end
        const newUpdatedSubs = subs.map( s => {
          if (s.id === id) {
            return res.data
          }
          return s
        })
        setSubs(newUpdatedSubs)
      })
      .catch( err => console.log(err) )
  }

  const deleteSub = (id) => {
    // make sure its back ticks 
    // interpolting the id we are passing in
    // destroy in the back end
    axios.delete(`/api/subs/${id}`)
      .then( res => {
        // delete in the front end 
        // filter out the one delete, or filter in the all the one but the one we deleted
        setSubs(subs.filter( s => s.id !== id ))
      })
      .catch( err => console.log(err) )
  }

  return (
    <>
      <h1>All Sub Reddits</h1>
      <SubForm addSub={addSub} />
      <SubList 
        subs={subs}
        updateSub={updateSub}
        deleteSub={deleteSub}
      />
    </>
  )
}

export default Subs;