const express = require("express");
// const db = require("mysql2");
const { Pool } = require('pg');
// const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

//CONNECTION POOL 

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Evendor',
    password: 'Panda42069$',
    port: 5432,

});

app.use(bodyParser.json());

// POST ENDPOINT TO ACCEPT AND STORE EVENT DATA 
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
  // const { type, date } = req.query;

  let query = 'SELECT * FROM vendors';
  // const queryParams = [];

  // if (type) {
  //   query += ' WHERE type = $1';
  //   queryParams.push(type);
  // }

  // if (date) {
  //   if (queryParams.length === 0) {
  //     query += ' WHERE';
  //   } else {
  //     query += ' AND';
  //   }
  //   query += ' date = $' + (queryParams.length + 1);
  //   queryParams.push(date);
  // }

  try {
    const vendors_data = await pool.query(query);
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