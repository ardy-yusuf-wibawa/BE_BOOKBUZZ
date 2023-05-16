'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class genre_detail extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  genre_detail.init({
    genre_id: DataTypes.INTEGER,
    genre_name: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'genre_detail',
  });
  return genre_detail;
};