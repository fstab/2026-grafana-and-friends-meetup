require('dotenv').config();
const express = require('express');
const path = require('path');
const app = express();

const grotsRoute = require('./routes/grots');
app.use('/grots', grotsRoute)

// If the routes above don't match, serve the static content from ../react-client
app.use(express.static(path.join(__dirname, '../react-client/build')));

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});