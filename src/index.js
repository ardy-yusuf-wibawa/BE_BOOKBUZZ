require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { sequelize } = require('./models')

// const router = require('./routes/router');
const productRouter = require('./routes/product.router')
const userEndPoint = require('./routes/users.router')
const orderRouter = require('./routes/order.router')
const historyDetail = require('./routes/history.router')
const wishlistList = require('./routes/wishlist.router')
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cors({ origin: true, credentials: true }));

sequelize.authenticate().then(function(err) {
    console.log('database has been connected')
}).catch(function(err) {
    console.log('unable to connect', err)
})
app.use('/', productRouter)
app.use('/', userEndPoint)
app.use('/', orderRouter)
app.use('/', historyDetail)
app.use('/', wishlistList)

app.listen(process.env.SERVER_PORT, () => { console.log('Server Running ' + process.env.SERVER_PORT) });
