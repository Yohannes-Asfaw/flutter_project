const express = require('express')
const {Application,validateApply} = require('../models/application')
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
    module.exports=router