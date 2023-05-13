// transaction.router.js

const express = require('express');
const Controller = require('../controllers/transaction.controller');

const router = express.Router();

router.get('/transaction/:id', Controller.getDetailTransaction);
router.post('/transaction', Controller.postTransaction);

module.exports = router;