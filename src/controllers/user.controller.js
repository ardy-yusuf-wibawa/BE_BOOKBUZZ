const { users } = require('../models');

exports.userCreate = async (req, res, next) => {
    try {
        const createUser = await users.create({
            fullname: req.body.fullname,
            username: req.body.username,
            email: req.body.email,
            password: req.body.password,
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