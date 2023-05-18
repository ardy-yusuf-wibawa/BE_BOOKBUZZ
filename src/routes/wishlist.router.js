const express = require('express');
const Controller = require('../controllers/wishlist.controller');

const router = express.Router();

router.post('/wishlist', Controller.postWishlist);
router.get('/wishlist', Controller.getWishlist);
router.delete('/wishlist', Controller.deleteWishlist);


module.exports = router;