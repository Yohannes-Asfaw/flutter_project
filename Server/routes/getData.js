const express = require('express')
const {Company} = require('../models/company')
const {User}=require('../models/users')
const {Post}=require('../models/post_form')
const router = express.Router()


router.get('/companies',async (req,res)=>{
    let company = await Company.find()

   res.send(company)
    

})
router.get('/user/:id',async (req,res)=>{
    const id = req.params.id
    let user = await User .findById(id)
   res.send(user)

})
router.get('/users',async (req,res)=>{
    let user = await User.find()
   res.send(user)

})
router.get('/company/:id',async (req,res)=>{
    const id = req.params.id
    let company = await Company .findById(id)
   res.send(company)

})
router.get('/posts',async (req,res)=>{
    const post = await Post.find()

   res.send(post)
    

})


module.exports=router