const express = require('express')
const {Post,validatePost} = require('../models/post_form')
const router = express.Router()



router.post('/',async (req,res)=>{
    const {error} = validatePost(req.body)
    if(error){
        return res.status(400).send(error.details[0].message)
    }
    
    
    const post = new Post({
         password:req.body.password,
        company_name:req.body.company_name,
        Company_website:req.body.Company_website,
        dedicated_field:req.body.dedicated_field,
        Address:req.body.Address,
        subject:req.body.subject,
        description:req.body.description

    })

    
     await post.save()
      const token = post.generateregtoken()
    res.send('Post success')
    

})
module.exports=router