const express = require('express')
const router = express.Router()
const UsersModel = require('../models/users')

router.get('/', async (req, res) => {
    const users = await UsersModel.findAll()
    res.status(200).json({
        data: "testing",
        metadata: "testing get user endpoint"
    })
})

router.post('/', async(req, res) => {
    const { fullname, username, email, password } = req.body
    const users = await UsersModel.create({
        fullname, username, email, password 
    })
    res.status(200).json({
        data: users,
        metadata: "testing post user endpoint"
    })
})

module.exports = router