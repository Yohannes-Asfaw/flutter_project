const logger =require('../startup/logging')

module.exports =function(err,req,res,next){
    // log the exeption on the database
    logger.error(err.message,err)
    res.status(500).send('something failed')
}


