"use strict";
const express = require('express')
const router = express.Router()

//Controllers
const vaccine = require('../controllers/vaccineController')

//Middlewares
const { hasToken } = require('../middlewares')

//Routes
router.post('/vaccine', hasToken, vaccine.create_vaccine)

router.get("/vaccines", hasToken, vaccine.list_vaccines)

router.get("/vaccine/:vaccineId", hasToken, vaccine.read_a_vaccine)
router.delete("/vaccine/:vaccineId", hasToken, vaccine.delete_vaccine)
      
//Export
module.exports = router