const logger= require('./startup/logging')
const express= require('express')
const app = express()

require('./startup/logging')
require('./startup/routes')(app)
require('./startup/db')()
require('./startup/config')()



const port = process.env.PORT || 3000
app.listen(port,()=>logger.info(`listening on port ${port}`))




