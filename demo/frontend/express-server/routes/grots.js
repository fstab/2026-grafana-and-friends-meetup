const express = require('express');
const axios = require('axios');
const router = express.Router();

// Define a route
router.get('/', (req, res) => {
    axios.get(process.env.GROT_DB_SERVICE_URL + '/grots')
       .then(response => { console.log("called " + process.env.GROT_DB_SERVICE_URL + ", got HTTP " + response.status); console.log(response.data + "\n"); res.json(response.data) } );
       //.catch(err => res.secn(err));
});

//router.get('/101', (req, res) => {
//    res.send('this is grots/101 route');// this gets executed when user visit http://localhost:3000/grots/101
//});

// export the router module so that server.js file can use it
module.exports = router;