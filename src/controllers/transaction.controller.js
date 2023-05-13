const { transaction } = require('../models')
const { Op } = require('sequelize')

exports.getDetailTransaction = async (req, res, next) => {
  try {
    const id = req.params.id;
    const transactions = await transaction.findAll({
      where: {
        nomor_order: id
      }
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
    const createTransaction = await transaction.create({
      product_id: req.body.product_id,
      quantity: req.body.quantity,
      nomor_order: req.body.nomor_order,
    });

    console.log(createTransaction);

    res.status(201).json({
      message: 'Successfully added transaction',
      data: createTransaction,
    });
  } catch (error) {
    console.error('Error creating a new transaction:', error);
    res.status(500).json({
      message: 'Failed to create a new transaction',
    });
  }
};