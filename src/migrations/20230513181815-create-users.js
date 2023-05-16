'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('users', {
      user_id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      fullname: {
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
          notEmpty: true, // Ensure the fullname is not empty
        }
      },
      username: {
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
          notEmpty: true, // Ensure the username is not empty
        }
      },
      email: {
        type: Sequelize.STRING,
        unique: true,
        validate: {
          isEmail: true, // Ensure the email is a valid email format
        }
      },
      password: {
        type: Sequelize.STRING,
        allowNull: false,
        validate: {
          notEmpty: true, // Ensure the password is not empty
          len: [8, 100], // Require a minimum length of 8 characters
          isUppercase: true, // Require at least 1 uppercase letter
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('users');
  }
};