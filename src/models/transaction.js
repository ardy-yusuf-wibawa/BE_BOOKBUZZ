'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class transaction extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      transaction.belongsTo(models.transaction_detail, {
        foreignKey: 'order_id',
        as: 'order'
      });
    }
  }
  transaction.init({
    user_id: DataTypes.INTEGER,
    order_id: DataTypes.STRING,
    total_price: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'transaction',
  });
  return transaction;
};