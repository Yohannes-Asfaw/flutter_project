const express = require('express')
const {Application,validateApply} = require('../models/application')
const router = express.Router()



router.post('/',async (req,res)=>{
    const {error} = validateApply(req.body)
    if(error){
        console.log(error.details[0].message)
        return res.status(400).send(error.details[0].message)
        

    }
    let apply = await Application.findOne().and([{Subject:req.body.Subject},{user:req.body.user}])
    if(apply){
        return res.status(409).send('You have already Applied')
    }
     apply = new Application({
        user:req.body.user,
        cgpa:req.body.cgpa,
        description:req.body.description,
        Subject:req.body.Subject,
        Seen:req.body.Seen,
        company:req.body.company
    })
    await apply.save()
    
    // const token = apply.generateregtoken()
    res.send(apply.Subject)
    

})
module.exports=router