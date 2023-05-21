'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class products extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      products.belongsTo(models.genres_detail, {
        foreignKey: 'genre_id',
        as: 'genre'
      });
      products.belongsTo(models.reviews, {
        foreignKey: 'review_id',
        as: 'review'
      });


    }
  }
  products.init({
    product_id: DataTypes.STRING,
    title_book: DataTypes.STRING,
    author: DataTypes.STRING,
    genre_id: DataTypes.INTEGER,
    description: DataTypes.TEXT,
    thumbnail: DataTypes.STRING,
    price: DataTypes.INTEGER,
    stock: DataTypes.INTEGER,
    review_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'products',
  });
  return products;
};