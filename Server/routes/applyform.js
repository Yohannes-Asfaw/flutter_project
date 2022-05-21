const express = require('express')
const {Application,validateApply} = require('../models/application')
const router = express.Router()



router.post('/',async (req,res)=>{
    const {error} = validateApply(req.body)
    if(error){
        console.log(error.details[0].message)
        return res.status(400).send(error.details[0].message)
        

    }
    let apply = await Application.findOne({Subject:req.body.Subject})
    if(apply){
        return res.status(409).send('You have already Applied')
    }
     apply = new Application({
        department:req.body.department,
        cgpa:req.body.cgpa,
        userName:req.body.userName,
        description:req.body.description,
        address:req.body.address,
        Subject:req.body.Subject,
        Seen:req.body.Seen,
    })

    
    await apply.save()
    // const token = apply.generateregtoken()
    res.send('applied successfully')
    

})
module.exports=router