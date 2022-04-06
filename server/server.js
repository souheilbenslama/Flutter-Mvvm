const bodyParser = require("body-parser");
const cors = require("cors");

// parse env variables
require("dotenv").config();

const helmet = require("helmet")

const express = require("express");
const app = express();
const port = process.env.PORT || 3001;




const mongoose = require("mongoose");


//Register schemas
require("./models/accountModel");
require("./models/vaccineModel");



mongoose.Promise = global.Promise;
mongoose.connect("mongodb+srv://petsi:petsi@cluster0.mrwox.mongodb.net/evax",
{useNewUrlParser: true, useUnifiedTopology: true,useCreateIndex:true,}).catch((err) => {
  console.error("error: " + err.stack);
  //throw new Error(err.err.stack);
});
mongoose.connection.on("open", () => {
console.log("Connected to mongoDB");
});

// Make uploads directory public
app.use('/images', express.static('images'))

app.use(cors({ origin: '*' }));

app.use(helmet());

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use((req, res, next) => {
  console.log(`::MongoDB:: ${req.method} : ${req.url}`)
  next()
})

//Routes
const Routes = require('./routes/routes')
Routes(app)

app.listen(port, () => {
  console.log("listening port => ", port);
});