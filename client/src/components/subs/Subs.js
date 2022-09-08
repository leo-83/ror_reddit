import { useState, useEffect } from 'react';
import axios from 'axios';

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

  return (
    <>
      <h1>All Sub Reddits</h1>
    </>
  )
}

export default Subs;