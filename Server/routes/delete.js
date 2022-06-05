const express = require('express')
const {Application,validateApply} = require('../models/application')
const { Company } = require('../models/company')
const { User } = require('../models/users')
const { Post } = require('../models/post_form')
const router = express.Router()

router.delete('/user/:id', async (req, res)=> {
    const id = req.params.id
    let user = await User.findByIdAndRemove(id)
    res.status(200).send(user)
    })
router.delete('/company/:id', async (req, res)=> {
    const id = req.params.id
    let company = await Company.findByIdAndDelete(id)
    res.status(200).send(company)
    })
    router.delete('/post/:subject', async (req, res)=> {
        const subject = req.params.subject
        let post = await Post.deleteOne({subject:subject})
        res.status(200).send(post)
        })
router.delete('/application/:subject', async (req, res)=> {
    const subject = req.params.subject
    let app = await Application.deleteOne({subject:subject})
    res.status(200).send(app)
    })
module.exports=router