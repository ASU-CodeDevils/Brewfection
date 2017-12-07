var express = require('express');
var path = require('path');
var serveStatic = require('serve-static');
const { Pool, Client } = require('pg')
const pool = new Pool({
    connectionString: process.env.DATABASE_URL
})


app = express();
app.use(serveStatic(__dirname));
app.get('/db', function (request, response) {
    pool.query('SELECT * FROM hops', function(err, res) {
        if (err)
            { console.error(err); response.send("Error " + err); }
        else
            { response.render('pages/db', {results: result.rows} ); }
    });
});
var port = process.env.PORT || 5000;
app.listen(port);
console.log('server started '+ port);