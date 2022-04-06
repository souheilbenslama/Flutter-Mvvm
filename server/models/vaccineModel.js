const mongoose = require('mongoose');
const Schema = mongoose.Schema

const vaccineSchema = new Schema({
    name: String,
    time: String,
    date: String,
    place: String,
    account: {
        type: Schema.Types.ObjectId,
        ref: "Account",
        required: true,
        autopopulate: true,
     },
})

//below line will automatically generate createdAt & updatedAt fields
vaccineSchema.set('timestamps', true);

module.exports = mongoose.model('Vaccine',vaccineSchema)