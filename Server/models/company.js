const mongoose = require('mongoose')
const Joi = require('joi')
const jwt = require('jsonwebtoken')
const config = require('config')


const companyschema = mongoose.Schema({
    company_name:{
        type:String,
        required:true,
        minlength:3,
    },
    password:{
        type:String,
        minlength:4,
        required:true,
        maxlength:1024
    },
    Company_website:{
        type:String,
        
    },
    Address:{
        type:String,
        required:true

    },
    dedicated_field:{
        type:String,
        required:true
    },
    role:{
        type:String,
        default:"Company"
    }

})

companyschema.methods.generateregtoken =function(){
const token = jwt.sign({_id:this._id,role:this.role,company_name:this.company_name},config.get('jwtwebtoken'))
return token
}

const Company = mongoose.model('Company',companyschema)

function validateCompany(company){
    const schema = Joi.object({
        // name:Joi.string(),
        password:Joi.string().min(4).max(1024).required(),
        company_name:Joi.string().min(3).required(),
        Company_website:Joi.string(),
        dedicated_field:Joi.string().required(),
        Address:Joi.string().required()
        
    })
    return schema.validate(company)
}
exports.Company=Company
exports.companyschema=companyschema
exports.validateCompany=validateCompany
