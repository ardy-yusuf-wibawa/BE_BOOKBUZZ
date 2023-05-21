const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { users } = require('../models');


exports.userCreate = async (req, res, next) => {
    try {
        const inputPassword = req.body
        const hashPassword = await bcrypt.hashSync(inputPassword.password, 8)
        const createUser = await users.create({
            fullname: req.body.fullname,
            username: req.body.username,
            email: req.body.email,
            password: hashPassword,
        });
    
        console.log(createUser);

        res.status(201).json({
            message: 'Successfully added user',
            data: createUser,
        });
    } catch (error) {
        console.error('Error creating a new user:', error);
        res.status(500).json({
            message: 'Failed to create a new user',
        });
    }
};

exports.login = async (req, res, next) => {
    try {
        const payload = req.body

        const getUser = await users.findOne({
            where: { email: payload.email }
        })

        console.log(getUser)

        if (!getUser) return res.status(404).send(`user not found`)

        const comparePassword = bcrypt.compareSync(payload.password, getUser.dataValues.password)


        if (comparePassword) {
            const token = jwt.sign({ id: getUser.dataValues.id, email: getUser.dataValues.email }, process.env.JWT_SECRET, { expiresIn: 3600 })
            // Set JWT token as a cookie
            res.cookie('jwt', token, { 
                maxAge: 3600000, // Expires in 1 hour
                httpOnly: true, // Cookie is only accessible by the web server
                secure: true // Cookie is only sent over HTTPS if the website has HTTPS enabled
            })
            return res.status(200).send({
                message: `login success`,
                token: token
            })
        } else {
            return res.status(400).send(`invalid password`)
        }
        
    } catch (error) {
        return res.status(500).send({
            err: error
        })
    }
}
exports.getDetailUser = async (req, res, next) => {
    try {
        const params = req.params.id

        const getUser = await user.findOne({
            where: { email: req.user.email }

        })
        if (req.user.id == !params) return res.status(403).send(`cannot acces another user details`)

        res.status(200).send({
            message: `data user retrieved`,
            data: getUser
        })

    } catch (error) {
        return res.status(500).send({
            error: error
        })
    }
}