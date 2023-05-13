const { product } = require('../models');
const { Op } = require('sequelize');

exports.getDetailProducts = async (req, res, next) => {
    try {
        const title = req.query.title;
        const author = req.query.author;
        const price = req.query.price;
        const genre = req.query.genre;

        let whereClause = {};

        if (title || author || price || genre) {
            whereClause = {
                [Op.and]: []
            };

            if (title) {
                whereClause[Op.and].push({
                    title_book: {
                        [Op.like]: `%${title}%`
                    }
                });
            }

            if (author) {
                whereClause[Op.and].push({
                    author: {
                        [Op.like]: `%${author}%`
                    }
                });
            }

            if (price) {
                whereClause[Op.and].push({
                    price: {
                        [Op.lte]: price
                    }
                });
            }
            if (genre) {
                whereClause[Op.and].push({
                    genre: {
                        [Op.like]: `%${genre}%`
                    }
                });
            }
        }

        const getProducts = await product.findAll({
            where: whereClause
        });

        if (getProducts.length === 0) {
            return res.status(404).send({
                message: `No products found with the provided: title=${title}, author=${author}, price=${price}`
            });
        }

        res.status(200).send({
            message: `Data retrieved`,
            data: getProducts
        });
    } catch (error) {
        return res.status(500).send({
            error: error.message || 'Internal server error'
        });
    }
};
