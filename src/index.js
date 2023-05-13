require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { sequelize } = require('./models')

// const router = require('./routes/router');
const productRouter = require('./routes/product.router')
const transactionRouter = require('./routes/transaction.router')
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
app.use('/', transactionRouter)

app.listen(process.env.SERVER_PORT, () => { console.log('Server Running ' + process.env.SERVER_PORT) });
