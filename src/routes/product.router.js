// product.router.js

const express = require('express');
const Controller = require('../controllers/product.controller');

const router = express.Router();

router.get('/product', Controller.getDetailProducts);

module.exports = router;