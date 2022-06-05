const express = require('express')
const {Company} = require('../models/company')
const {User}=require('../models/users')
const {Post}=require('../models/post_form')
const {Application}=require('../models/application')

const router = express.Router()


router.get('/companies',async (req,res)=>{
    let company = await Company.find()

   res.send(company)
    

})
router.get('/user/:id',async (req,res)=>{
    const id = req.params.id
    let user = await User.findById(id)
   res.send(user)

})
router.get('/users',async (req,res)=>{
    let user = await User.find()
   res.send(user)

})
router.get('/company/:id',async (req,res)=>{
    const id= req.params.id
    let company = await Company .findById(id)
   res.send(company)

})
router.get('/posts',async (req,res)=>{
    const post = await Post.find().populate('company')

   res.send(post)
    

})
router.get('/posts/:companyid',async (req,res)=>{
    const company=req.params.companyid
    const post = await Post.find({company:company}).populate('company');

   res.send(post)
    

})

router.get('/application/:company_name',async (req,res)=>{
    const company = req.params.company_name
    let application = await Application.find({company:company}).populate('user').populate('company')
   res.send(application)

})
router.get('/applications/:id',async (req,res)=>{
    const id = req.params.id
    let application = await Application.find({user:id}).or([{Seen:"Accepted"},{Seen:"Rejected"}]).populate('user').populate('company')
   res.send(application)

})



module.exports=router