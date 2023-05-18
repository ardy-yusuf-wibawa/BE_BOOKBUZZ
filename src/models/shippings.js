'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class shippings extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  shippings.init({
    user_id: DataTypes.INTEGER,
    phone_number: DataTypes.INTEGER,
    country: DataTypes.STRING,
    address: DataTypes.TEXT,
    apartment: DataTypes.STRING,
    city: DataTypes.STRING,
    province: DataTypes.STRING,
    postal_code: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'shippings',
  });
  return shippings;
};