const jwt = require('jsonwebtoken')
const config = require('config')

function auth(req,res,next){
const token = req.header('-x-login-token')
if(!token){
    return res.status(401).send('Access denied you are not allowed')
}
try{
const decoded = jwt.verify(token,config.get('jwtwebtoken'))
req.user=decoded
next()
}
catch(ex){
    res.status(400).send('the token is incorrect')
    
}

}
module.exports = auth

