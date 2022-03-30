const config = require('config')
module.exports=function(){
    if(!config.get('jwtwebtoken')){
    throw new Error('FATAL ERROR: jwtwebtoken is not defined')
}
}