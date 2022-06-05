const express = require('express')
const bcrypt = require('bcrypt')
const {User} = require('../models/users')
const {Company} = require('../models/company')
const router = express.Router()
const Joi = require('joi')


router.post('/user',async (req,res)=>{
    const {error} = validateUser(req.body)
    if(error){
        return res.status(400).send(error.details[0].message)
    }
    let user = await User.findOne({user_name:req.body.user_name})
    if(!user){
        return res.status(409).send('invalid username or password')
    }
    const isvalid = await bcrypt.compare(req.body.password,user.password)
    if(!isvalid){
        return res.status(400).send('invalid username or password')
    }
    const token = user.generateregtoken()
    res.status(200).json({
        "token": token,
        "user": user,
    })

    function validateUser(user){
    const schema = Joi.object({
        user_name:Joi.string().min(4).required(),
        password:Joi.string().min(4).max(1024).required()
    })
    return schema.validate(user)
}

})


router.post('/company',async (req,res)=>{
    const {error} = validateCompany(req.body)
    if(error){
        return res.status(400).send(error.details[0].message)
    }
    let company = await Company.findOne({company_name:req.body.company_name})
    if(!company){
        return res.status(400).send('invalid Companyname or password')
    }
    const isvalid = await bcrypt.compare(req.body.password,company.password)
    if(!isvalid){
        return res.status(400).send('invalid Companyname or password')
    }
    const token = company.generateregtoken()
    res.status(200).json({
        "token": token,
        "company": company,
        
    })

    function validateCompany(user){
    const schema = Joi.object({
        company_name:Joi.string().min(3).required(),
        password:Joi.string().min(4).max(1024).required()
    })
    return schema.validate(user)
}

})

module.exports=router