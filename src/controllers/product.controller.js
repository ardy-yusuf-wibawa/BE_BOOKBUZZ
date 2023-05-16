const { product, genre_detail, review_detail, review } = require('../models');
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
                    [Op.or]: [
                        {
                            genre_id: {
                                [Op.like]: `%${genre}%`
                            }
                        },
                        {
                            '$genre.genre_name$': {
                                [Op.like]: `%${genre}%`
                            }
                        }
                    ]
                });
            }
        }
        const getProducts = await product.findAll({
            where: whereClause,
            include: [
                {
                    model: genre_detail,
                    as: 'genre',
                    attributes: ['genre_id', 'genre_name']
                },
                {
                    model: review,
                    as: 'review',
                    attributes: ['review_id'],
                    include: [
                        {
                            model: review_detail,
                            as: 'views',
                            attributes: ['rating', 'comment']
                        },
                    ]
                }
            ]
        });

        if (getProducts.length === 0) {
            return res.status(404).send({
                message: `No products found with the provided: title=${title}, author=${author}, price=${price}`
            });
        }

        // const formattedProducts = getProducts.map((product) => ({
        //     id: product.id,
        //     product_id: product.product_id,
        //     title_book: product.title_book,
        //     author: product.author,
        //     genre: product.genre ? product.genre.genre_name : null, // Access the genre_name attribute
        //     description: product.description,
        //     thumbnail: product.thumbnail,
        //     price: product.price,
        //     stock: product.stock,
        //     review_id: product.review_id,
        //     createdAt: product.createdAt,
        //     updatedAt: product.updatedAt
        // }));

        res.status(200).send({
            message: 'Data retrieved',
            data: getProducts
        });
    } catch (error) {
        return res.status(500).send({
            error: error.message || 'Internal server error'
        });
    }
};