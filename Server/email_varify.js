const nodemailer = require('nodemailer');
const { transport } = require('winston');

const transporter = nodemailer.createTransport({
    service:'gmail',
    auth:{
       user:"jonathanasfaw11@gmail.com",
       pass:'0913635108a'
    },
    ls:{
        rejectUnauthorized:false
    }
});

const mailOptions={
    from:"jonathanasfaw11@gmail.com",
    to:"jovaniasfaw@gmail.com",
    subject:"sending email using node js",
    text:"hi i sent this email using node js "
};
transporter.sendMail(mailOptions,function(error,info){
    if(error){
        console.log(error);
    }
    else{
        console.log("email sent"+ info.response);
    }

})
