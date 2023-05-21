'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class historys extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  historys.init({
    user_id: DataTypes.INTEGER,
    order_id: DataTypes.STRING,
    is_checkout: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'historys',
  });
  return historys;
};