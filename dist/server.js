var express = require('express');
var path = require('path');
var pug = require('pug');
var serveStatic = require('serve-static');
var app = express();
const { Pool, Client } = require('pg')
const pool = new Pool({
    connectionString: process.env.DATABASE_URL
})
app.set('views','./views');
app.set('view engine', 'pug');
app.engine('pug', pug.__express);


app = express();
app.use(serveStatic(__dirname));
app.get('/hops', function (request, response) {
    pool.query('SELECT * FROM hops', function(err, res) {
        if (err)
            { console.error(err); response.send("Error " + err); }
        else
            { console.error(res.rows); response.send("hops \n" + JSON.stringify(res.rows, 2)); }
    });
});
var port = process.env.PORT || 5000;
app.listen(port);
console.log('server started '+ port);