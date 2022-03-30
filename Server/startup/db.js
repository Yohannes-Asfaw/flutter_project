const logger =require('./logging')
const mongoose = require('mongoose')
module.exports=function(){
    mongoose.connect('mongodb://localhost/DB1')
    .then(()=>logger.info('connected to mongodb'))
}