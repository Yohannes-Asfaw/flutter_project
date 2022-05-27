const express = require('express')
const {Application,validateApply} = require('../models/application')
const { User } = require('../models/users')
const router = express.Router()


router.put('/application/:Subject/:Seen', async (req, res)=> {
    const Subject = req.params.Subject
    let application = await Application.findOne({Subject:Subject})
    application.set({
        Seen:req.params.Seen
    })
    await application.save()
    res.status(200).send(application)
    })
router.put('/user/:username', async (req, res)=> {
    const user_name = req.params.username
    let user = await User.findOneAndUpdate({user_name:user_name},{$set:{
        full_name:req.body.full_name,
        user_name:req.body.user_name,
        department:req.body.department,
        Address:req.body.Address
        
    }})
    await user.save()
    res.status(200).send(user)
    })
router.put('/application/:username', async (req, res)=> {
    const user_name = req.params.username
    let application = await Application.findOneAndUpdate({user_name:user_name},{$set:{
        user_name:req.body.user_name,
        department:req.body.department,
        Address:req.body.Address
        
    }})
    await application.save()
    res.status(200).send(application)
    })
    module.exports=router