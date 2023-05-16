const express = require('express');
const Controller = require('../controllers/cart.controller');

const router = express.Router();

router.get('/cart', Controller.getCart);
router.post('/shop', Controller.postCart);

module.exports = router;