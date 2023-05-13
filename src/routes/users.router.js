const express = require('express')
const Controller = require('../controllers/user.controller');
const router = express.Router();

router.post('/users', Controller.userCreate)

module.exports = router


