'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class review extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      review.hasMany(models.review_detail, {
        foreignKey: 'review_id',
        as: 'views'
      });
      review.hasOne(models.product, {
        foreignKey: 'review_id',
        as: 'review'
      });
    }
  }
  review.init({
    review_id: DataTypes.INTEGER,
    product_id: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'review',
  });
  return review;
};