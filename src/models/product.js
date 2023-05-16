'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  class product extends Model {
    static associate(models) {
      // Define associations here
      product.belongsTo(models.genre_detail, {
        foreignKey: 'genre_id',
        as: 'genre'
      });
      // product.belongsTo(models.review, {
      //   foreignKey: 'review_id',
      //   as: 'review'
      // });
      product.hasMany(models.review, {
        foreignKey: 'review_id',
        as: 'review'
      });
      product.hasMany(models.cart, {
        foreignKey: 'product_id',
        as: 'product'
      });

    }
  }

  product.init({
    product_id: DataTypes.STRING,
    title_book: DataTypes.STRING,
    author: DataTypes.STRING,
    genre_id: DataTypes.INTEGER,
    description: DataTypes.STRING,
    thumbnail: DataTypes.STRING,
    price: DataTypes.INTEGER,
    stock: DataTypes.INTEGER,
    review_id: DataTypes.INTEGER,

  }, {
    sequelize,
    modelName: 'product',
  });

  return product;
};
