const { Model, DataTypes, STRING } = require('sequelize')
const sequelize = require('../db-config')

class User extends Model {}

User.init({
    fullname: {
        type: DataTypes.STRING
    },
    username: {
        type: DataTypes.STRING,
        unique: true
    },
    email: {
        type: DataTypes.STRING,
        unique: true
    },
    password: {
        type: STRING
    }
    
}, {
    sequelize,
    modelName: 'Users'
})

module.exports = User