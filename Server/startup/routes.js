const express = require('express')
const regestration = require('../routes/registration')
const login = require('../routes/login')
const error = require('../middelware/error')
const getData = require('../routes/getData')
const apply = require('../routes/applyform')
const post = require('../routes/post')
const cors = require("cors");


module.exports=function(app){
    app.use(express.json())
    app.use(cors());
    app.use('/reg',regestration)
    app.use('/login',login)
    app.use('/get',getData)
    app.use('/apply',apply)
    app.use('/post',post)
    app.use(error)
}