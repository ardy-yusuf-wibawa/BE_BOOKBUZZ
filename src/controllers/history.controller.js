const { historys, orders, orders_detail, products } = require('../models');


exports.postHistory = async (req, res, next) => {
    try {
        const { user_id, order_id, is_checkout } = req.body;

        const postHistorys = await historys.create({
            user_id: user_id,
            order_id: order_id,
            is_checkout: is_checkout
        });

        console.log(postHistorys);
        
        const existingOrder = await orders.findOne({
            where: { order_id: order_id }
        });

        if (!existingOrder) {
            return res.status(404).json({ message: 'Order not found' });
        }

        const deletedOrder = await orders.destroy({
            where: { order_id: order_id },
        });



        const getQuantity = await orders_detail.findAll({
            where: { order_id: order_id }
        });
        console.log(getQuantity);

        const updateQuantity = [];
        const valStock = [];
        const stockVal = [];
        const updateStock = [];

        for (const value of getQuantity) {
            const valueStock = value.dataValues.quantity;
            console.log(valueStock); // Output the stock value
            valStock.push(valueStock);
        }

        for (const order of getQuantity) {
            const productID = order.dataValues.product_id;
            const getStock = await products.findAll({
                where: { product_id: productID }
            });
            updateQuantity.push(getStock);
            console.log(getStock);
        }

        for (let i = 0; i < updateQuantity.length; i++) {
            const stockValue = updateQuantity[i][0].dataValues.stock; // Assuming there's only one result per product
            console.log(stockValue); // Output the stock value
            stockVal.push(stockValue);
        }

        const realStock = stockVal.map((stock, index) => stock - valStock[index]);
        console.log(realStock);

        for (let i = 0; i < getQuantity.length; i++) {
            const order = getQuantity[i];
            const productID = order.dataValues.product_id;
            const updateQTY = await products.update(
                { stock: realStock[i] }, // Convert realStock to a string
                {
                    where: { product_id: productID }
                }
            );
            updateStock.push(updateQTY);
            console.log(updateQTY);
        }



        res.status(200).json({
            message: 'Data received',
            data: {
                postHistory:
                    // postHistorys,
                    getQuantity,
                updateQuantity
                //   orderDetails: getOrderDetails,
            },
        });
    } catch (error) {
        console.error('Error retrieving orders:', error);
        res.status(500).json({
            error: error.message || 'Internal server error',
        });
    }
};
