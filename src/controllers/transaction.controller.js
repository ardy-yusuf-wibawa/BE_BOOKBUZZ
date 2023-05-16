const { transaction, transaction_detail } = require('../models')
const { Op } = require('sequelize')
const { incrementOrderNumber } = require("../helpers/utils")

exports.getDetailTransaction = async (req, res, next) => {
  try {

    const transactions = await transaction.findAll({
      include: [
        {
          model: transaction_detail,
          as: 'order',
          attributes: ['product_id', 'quantity']
        }
      ]

    });

    res.status(200).json({
      message: 'Data received',
      data: transactions
    });
  } catch (error) {
    console.error('Error retrieving transactions:', error);
    res.status(500).json({
      error: error.message || 'Internal server error'
    });
  }
}

exports.postTransaction = async (req, res) => {
  try {
    const { user_id, total_price, product } = req.body;

    const createTransaction = await transaction.create({
      user_id: user_id,
      order_id: incrementOrderNumber(),
      total_price: total_price,
    });

    const transactionId = createTransaction.order_id

    const transactionDetails = product.map(({ product_id, quantity }) => {
      return {
        order_id: transactionId,
        product_id: product_id,
        quantity: quantity,
      };
    });

    // Bulk insert the transaction details into the transaction_details table
    await transaction_detail.bulkCreate(transactionDetails);

    console.log({ createTransaction: transactionDetails });

    res.status(201).json({
      message: 'Successfully added transaction',
      data: createTransaction, transactionDetails
    });
  } catch (error) {
    console.error('Error creating a new transaction:', error);
    res.status(500).json({
      message: 'Failed to create a new transaction',
    });
  }
};
