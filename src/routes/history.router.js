const express = require('express');
const Controller = require('../controllers/history.controller');

const router = express.Router();

router.post('/cart', Controller.postHistory);

module.exports = router;