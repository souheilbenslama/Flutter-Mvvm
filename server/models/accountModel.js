const mongoose = require('mongoose');
const Schema = mongoose.Schema

const accountSchema = new Schema({
    email: {
        required:true,
        unique:true,
        type: String,
    },
    password: {
        required: true,
        type: String,
    },
    name: {
        required: true,
        type: String,
    },
    birthdate: {
        required: true,
        type: String,
    },
    address: {
        required: true,
        type: String,
    }
})

module.exports = mongoose.model('Account',accountSchema)