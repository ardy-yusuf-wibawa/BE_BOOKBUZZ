'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('history', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.INTEGER,
        unique: true

      },
      order_id: {
        type: Sequelize.INTEGER,
        unique: true
       
      },
      is_checkout: {
        type: Sequelize.BOOLEAN, // Changed the data type to BOOLEAN
        allowNull: false,
        defaultValue: false, // Set the default value to false
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
    await queryInterface.addConstraint('transactions', {
      fields: ['is_checkout'],
      type: 'check',
      where: {
        is_checkout: [false, true] // Only allow values 0 (false) or 1 (true)
      }
    });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('history');
  }
};