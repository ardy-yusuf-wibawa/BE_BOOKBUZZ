const express = require('express')
const Controller = require('../controllers/user.controller');
const router = express.Router();
const middleware = require('../middleware/middleware')

router.get('/userdetail/:id', middleware.verifyToken, Controller.getDetailUser)
router.post('/users', Controller.userCreate)
router.post('/login', Controller.login)

module.exports = router


