const express = require('express')
const app = express()
const port = 3000
const cors = require('cors')

const sequelize = require('./db-config')
sequelize.sync().then(() => console.log('database ready!'))

const UserEndPoint = require('./routes/users')
const bodyParser = require('body-parser')
app.use(cors())
app.use(bodyParser.json())

app.use('/users', UserEndPoint)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})