const { transaction } = require('../models')
const { Op } = require('sequelize')

exports.getDetailTransaction = async (req, res, next) => {
    try {
      const nomorOrder = req.params.nomor_order;
      
      const getOrder = await transaction.findOne({
        where: { nomor_order: nomorOrder },
      });
      
      if (!getOrder) {
        return res.status(404).json({
          message: 'Transaction not found',
        });
      }
  
      if (getOrder.id !== req.transaction.nomor_order) {
        return res.status(403).json({
          message: 'Cannot access',
        });
      }
  
      res.status(200).json({
        message: 'Data received',
        data: getOrder,
      });
    } catch (error) {
      console.error('Error retrieving transaction details:', error);
      res.status(500).json({
        error: error.message || 'Internal server error',
      });
    }
  };

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