const express = require('express')
const app = express()
const port = 3000
const mysql = require('mysql2');
var connection = mysql.createConnection({
  host     : process.env.DB_PORT_3306_TCP_ADDR, 
  user     : 'root',
  password : 'toto'
});

app.get('/', (req, res) => {
  connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
    if (error) throw error;
    console.log('The solution is: ', results[0].solution);
  });
  res.status("200").send("request ....")
  
})

app.get('/init', (req, res) => {
  connection.query('CREATE DATABASE monapp', function (error, results, fields) {
  });
  res.status("200").send("request ....")
});

app.listen(port, () => {
  connection.connect();
  console.log(`Example app listening at http://localhost:${port}`)
  console.log(`CTRL+C to stop application`)
})
