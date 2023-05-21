'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class reviews extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      reviews.hasMany(models.reviews_detail, {
        foreignKey: 'review_id',
        as: 'views'
      });
    }
  }
  reviews.init({
    review_id: DataTypes.INTEGER,
    product_id: DataTypes.STRING,
    avgRating: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'reviews',
  });
  return reviews;
};