'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class transaction_detail extends Model {
    static associate(models) {
    }
  }

  transaction_detail.init({
    product_id:
      DataTypes.STRING,

    order_id:
      DataTypes.STRING,

    quantity: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'transaction_detail',
  });

  return transaction_detail;
};
