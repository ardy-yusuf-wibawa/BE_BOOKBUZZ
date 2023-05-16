'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class history extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      history.belongsTo(models.users, {
        foreignKey: 'user_id',
      });
      history.belongsTo(models.transaction, {
        foreignKey: 'order_id',
      });
    }
  }
  history.init({
    user_id: DataTypes.INTEGER,


    order_id: DataTypes.INTEGER,
    is_checkout: DataTypes.BOOLEAN,
  }, {
    sequelize,
    modelName: 'history',
  });
  return history;
};