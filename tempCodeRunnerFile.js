const express = require("express");
// const db = require("mysql2");
const { Pool } = require('pg');
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();
const port = 8080;

//CONNECTION POOL 

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Evendor',
    password: 'Panda666',
    port: 5432,

});

app.use(bodyParser.json());

app.use(
  cors({
    origin: 'http://localhost:3000',
  })
);
// POST ENDPOINT TO ACCEPT AND STORE VENDOR DATA 
app.post('/VendorList', async (req, res) => {
    const eventData = req.body;


      // VALIDATE EVENT DATA HERE

  try {
    await pool.query('INSERT INTO events (type, date, data) VALUES ($1, $2, $3)', [eventData.type, eventData.date, eventData.data]);
    res.status(201).send('Event data stored successfully');
  } catch (error) {
    console.error('Error storing event data:', error);
    res.status(500).send('Internal Server Error');
  }
});

// GET endpoint to retrieve event data with filters
app.get('/vendors', async (req, res) => {
  const { page = 1 } = req.query;
  const offset = (page - 1) * 20;

  let query = `SELECT * FROM vendors;`;

  console.log(page);
 
  try {
    const vendors_data = await pool.query(query);
    debugger
    res.status(200).send(vendors_data)
  } catch (error) {
    console.error('Error retrieving event data:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${5432}`);
});