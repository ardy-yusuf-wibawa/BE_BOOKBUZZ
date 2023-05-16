const { cart_detail, cart } = require('../models');

exports.getCart = async (req, res, next) => {
    try {
  

        const getCarts = await cart.findAll({
         
            attributes: ['id', 'cart_id', 'user_id', 'createdAt', 'updatedAt'] // Adjust the column names accordingly
        });

        res.status(200).json({
            message: 'Data received',
            data: getCarts,
        });
    } catch (error) {
        console.error('Error retrieving transactions:', error);
        res.status(500).json({
            error: error.message || 'Internal server error',
        });
    }
};






exports.postCart = async (req, res) => {
    try {
        const { user_id, product_id, quantity } = req.body;

        const createTransaction = await cart.create({
            user_id: user_id,
            product_id: product_id,
            quantity: quantity,
        });

        console.log(createTransaction);

        res.status(201).json({
            message: 'Successfully added transaction',
            data: createTransaction
        });
    } catch (error) {
        console.error('Error creating a new transaction:', error);
        res.status(500).json({
            message: 'Failed to create a new transaction',
        });
    }
};
