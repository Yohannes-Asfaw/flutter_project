const mongoose = require('mongoose')
const Joi = require('joi')
const jwt = require('jsonwebtoken')
const config = require('config')
const { join } = require('lodash')


const applyschema = mongoose.Schema({
    userName:{
        type:String,
        required:true,
        minlength:4,
    },
    address:{
        type:String,
        required:true,
    },
    cgpa:{
        type:String   
    },
    description:{
        type:String,
        required:true

    },
    department:{
        type:String,
        required:true
    },
    company_name:{
        type:String,
        required:true
    }
})

// applyschema.methods.generateregtoken =function(){
// const token = jwt.sign({_id:this._id},config.get('jwtwebtoken'))
// return token
// }

const Application = mongoose.model('Application',applyschema)

function validateApply(application){
    const schema = Joi.object({
        department:Joi.string().required(),
        cgpa:Joi.string().required(),
        userName:Joi.string().required().min(4),
        description:Joi.string().required(),
        address:Joi.string().required(),
        company_name:Joi.string().required()
    })
    return schema.validate(application)
}
exports.Application=Application
exports.applyschema=applyschema
exports.validateApply=validateApply
