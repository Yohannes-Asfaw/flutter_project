const express = require('express')
const bcrypt = require('bcrypt')
const {User,validateUser} = require('../models/users')
const {Company,validateCompany} = require('../models/company')
const router = express.Router()
const lodash = require('lodash')


router.post('/user',async (req,res)=>{
    const {error} = validateUser(req.body)
    if(error){
        console.log((error.details[0].message))
        return res.status(400).send(error.details[0].message)
    }
    let user = await User.findOne({user_name:req.body.user_name})
    if(user){
        return res.status(409).send('User Name already registered')
    }
     user = new User({
        password:req.body.password,
        full_name:req.body.full_name,
        user_name:req.body.user_name,
        university:req.body.university,
        department:req.body.department,
        Address:req.body.Address
    })

    const salt = await bcrypt.genSalt(10)
    user.password = await bcrypt.hash(user.password,salt)
     await user.save()
      const token = user.generateregtoken()
    res.send(user)
    

})

router.post('/company',async (req,res)=>{
    const {error} = validateCompany(req.body)
    if(error){
        return res.status(400).send(error.details[0].message)
    }
    let company = await Company.findOne({company_name:req.body.company_name})
    if(company){
        return res.status(409).send('Company Name already registered')
    }
     company = new Company({
        password:req.body.password,
        company_name:req.body.company_name,
        Company_website:req.body.Company_website,
        dedicated_field:req.body.dedicated_field,
        Address:req.body.Address
    })

    const salt = await bcrypt.genSalt(10)
    company.password = await bcrypt.hash(company.password,salt)
     await company.save()
      const token = company.generateregtoken()
    res.send(company)
})

module.exports=router