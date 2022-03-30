const winston = require('winston')
require('winston-mongodb')
require('express-async-errors')

  const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  
  transports: [
    //
    // - Write all logs with importance level of `error` or less to `error.log`
    // - Write all logs with importance level of `info` or less to `combined.log`
    //
    new winston.transports.File({ filename: 'error.log', level: 'error',handleExceptions: true }),
    new winston.transports.File({ filename: 'combined.log' }),
     new winston.transports.Console({
     
      level: 'info',
      format: winston.format.combine(
        winston.format.prettyPrint(),
        winston.format.colorize(),
        winston.format.simple(),
      ),
       handleExceptions: true,
    })
  ],
   rejectionHandlers: [
    new winston.transports.File({ filename: 'rejections.log' })
  ]
});
    
module.exports=logger
