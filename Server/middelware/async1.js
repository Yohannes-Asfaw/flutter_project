module.exports=function (handeler){
    return async (req,res,next)=>{
    try{
     await handeler()
    }
    catch(ex){
       next(ex)
    }
}
}