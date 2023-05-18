const { wishlist } = require('../models');

exports.postWishlist = async (req, res, next) => {
    try {
        const { user_id, product_id, quantity } = req.body;

        const postWish = await wishlist.create(
            {
                user_id: user_id,
                product_id: product_id,
                quantity: quantity
            },
        );

        console.log(postWish);

        res.status(200).json({
            message: 'Data received',
            data: postWish
        });
    } catch (error) {
        console.error('Error retrieving orders:', error);
        res.status(500).json({
            error: error.message || 'Internal server error',
        });
    }
};


exports.getWishlist = async (req, res) => {


    try {
        const { user_id } = req.body;

        const getWish = await wishlist.findAll({
            where:
            {
                user_id: user_id,
            },
        }

        );

        res.status(201).json({
            message: 'Successfully get wishlist product',
            data: getWish,
          
        });
    } catch (error) {
        console.error('Error getting wishlist:', error);

        res.status(500).json({
            message: 'Failed',
        });
    }
};



exports.deleteWishlist = async (req, res) => {


    try {
        const { user_id, product_id } = req.body;

        const delWish = await wishlist.destroy({
            where:
            {
                user_id: user_id,
                product_id: product_id
            },
        }

        );

        res.status(201).json({
            message: 'Successfully delete product',
          
        });
    } catch (error) {
        console.error('Error delete a product wishlist:', error);

        res.status(500).json({
            message: 'Failed to create a new transaction',
        });
    }
};



