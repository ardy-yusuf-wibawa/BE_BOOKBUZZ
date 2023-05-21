const { orders, orders_detail, users } = require('../models');
const { incrementOrderNumber } = require('../helpers/utils')
const { sequelize } = require('../models');

exports.getOrder = async (req, res, next) => {
    try {
      const { id } = req.params;
  
      const getUser = await orders.findAll({
        where: { id: id },
      });
  
      console.log(getUser);
  
      const getOrderDetails = [];
  
      for (const order of getUser) {
        const orderID = order.dataValues.order_id;
        const details = await orders_detail.findAll({
          where: { order_id: orderID },
        });
        getOrderDetails.push(details);
      }
  
      console.log(getOrderDetails);
  
      res.status(200).json({
        message: 'Data received',
        data: {
          userOrders: getUser,
          orderDetails: getOrderDetails,
        },
      });
    } catch (error) {
      console.error('Error retrieving orders:', error);
      res.status(500).json({
        error: error.message || 'Internal server error',
      });
    }
  };


exports.postOrder = async (req, res) => {
    const t = await sequelize.transaction(); // Start a database transaction

    try {
        const { user_id, order } = req.body;

        const createOrder = await orders.create(
            {
                user_id: user_id,
                order_id: incrementOrderNumber(),
            },
            { transaction: t } // Pass the transaction to the create method
        );

        const orderId = createOrder.order_id;

        const orderDetails = order.map(({ product_id, quantity }) => {
            return {
                order_id: orderId,
                product_id: product_id,
                quantity: quantity,
            };
        });

        // Bulk insert the transaction details into the orders_detail table
        await orders_detail.bulkCreate(orderDetails, { transaction: t });

        console.log({ createOrder: orderDetails });

        await t.commit(); // Commit the transaction if all operations are successful

        res.status(201).json({
            message: 'Successfully added transaction',
            data: createOrder,
            orderDetails,
        });
    } catch (error) {
        console.error('Error creating a new transaction:', error);
        await t.rollback(); // Rollback the transaction if any error occurs
        res.status(500).json({
            message: 'Failed to create a new transaction',
        });
    }
};






