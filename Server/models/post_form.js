const mongoose = require('mongoose')
const Joi = require('joi')
const jwt = require('jsonwebtoken')
const config = require('config')


const Postformschema = mongoose.Schema({
    company:{
        type:mongoose.Schema.Types.ObjectId,
        ref:"Company"
    },
    subject:{
        type:String,
        required:true,
        minlength:4,
    },
    description:{
        type:String,
        required:true,
        minlength:15,
    },

})

Postformschema.methods.generateregtoken =function(){
const token = jwt.sign({_id:this._id,role:this.role},config.get('jwtwebtoken'))
return token
}

const Post = mongoose.model('Post',Postformschema)

function validatePost(post){
    const schema = Joi.object({
        company:Joi.required(),
        subject:Joi.string().required().min(4),
        description:Joi.string().required().min(15)

    })
    return schema.validate(post)
}
exports.Post=Post
exports.Postformschema=Postformschema
exports.validatePost=validatePost
