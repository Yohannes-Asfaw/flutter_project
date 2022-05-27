const mongoose = require('mongoose')
const Joi = require('joi')
const jwt = require('jsonwebtoken')
const config = require('config')


const userschema = mongoose.Schema({
    user_name:{
        type:String,
        unique:true,
        required:true,
        minlength:4,  
    },
    full_name:{
        type:String,
        required:true,
        minlength:5,
    },
    password:{
        type:String,
        minlength:4,
        required:true,
        maxlength:1024
    },
    university:{
        type:String,
    },
    department:{
        type:String,
        required:true
    },
    Address:{
        type:String,
        required:true

    },
    role:{
        type:String,
        default:"user"
    }
})

userschema.methods.generateregtoken =function(){
const token = jwt.sign({_id:this._id,role:this.role,full_name:this.full_name},config.get('jwtwebtoken'))
return token
}
const User = mongoose.model('User',userschema)

function validateUser(user){
    const schema = Joi.object({
        // name:Joi.string(),
        password:Joi.string().min(4).max(1024).required(),
        user_name:Joi.string().min(4).required(),
        full_name:Joi.string().min(5).required(),
        university:Joi.string(),
        department:Joi.string().required(),
        Address:Joi.string().required()
    })
    return schema.validate(user)
}

exports.User=User
exports.userschema=userschema
exports.validateUser=validateUser