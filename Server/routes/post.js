const express = require('express')
const {Post,validatePost} = require('../models/post_form')
const router = express.Router()



router.post('/',async (req,res)=>{
    const {error} = validatePost(req.body)
    if(error){
        return res.status(400).send(error.details[0].message)
    }
    
    
    const post = new Post({
        company:req.body.company,
        subject:req.body.subject,
        description:req.body.description

    })

    
     await post.save()
      const token = post.generateregtoken()
    res.send('Post success')
    

})
module.exports=router