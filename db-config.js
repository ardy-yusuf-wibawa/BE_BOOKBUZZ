const { Sequelize } = require('sequelize')

const sequelize = new Sequelize('db_bookbuzz', 'root', '', {
    dialect: 'mysql',
    host: 'localhost'
})

module.exports = sequelize