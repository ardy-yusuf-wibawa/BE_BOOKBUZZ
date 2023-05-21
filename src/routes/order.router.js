const express = require('express');
const Controller = require('../controllers/order.controller');

const router = express.Router();

router.get('/order/:id', Controller.getOrder);
router.post('/shop', Controller.postOrder);

module.exports = router;