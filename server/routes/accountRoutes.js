"use strict";
const express = require('express')
const router = express.Router()

//Controllers
const account = require('../controllers/accountController')

//Routes
router.post('/signup', account.create_account)

router.post('/login', account.login)

router.get('/account', account.get_account)

router.put('/account/:accountId',account.update_account)

router.put('/accountpwd', account.updatepwd)

//Export
module.exports = router

  