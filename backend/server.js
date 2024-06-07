const express = require("express");
const cors = require("cors");

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// database
const db = require("./app/models");
const Role = db.role;

// db.sequelize.sync();
// force: true will drop the table if it already exists
//db.sequelize.sync({force: true}).then(() => {
  db.sequelize.sync({force: false}).then(() => {
  console.log('Drop and Resync Database with { force: false }');
  //initial();
});

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Bienvenido a la aplicación backend." });
});

// routes
require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);
require('./app/routes/products.routes')(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

/*
For production, just insert these rows manually and use sync() without parameters to avoid dropping data:

...
const app = express();
app.use(...);

const db = require("./app/models");

db.sequelize.sync();
...
*/
/*
function initial() {
  Role.create({
    id: 1,
    name: "user"
  });
 
  Role.create({
    id: 2,
    name: "moderator"
  });
 
  Role.create({
    id: 3,
    name: "admin"
  });
}
*/