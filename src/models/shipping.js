'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class shipping extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      shipping.belongsTo(models.users, {
        foreignKey: 'user_id',
      });
    }
  }
  shipping.init({
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
    modelName: 'shipping',
  });
  return shipping;
};