const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const offerSchema = new Schema({
  studentName: {
    type: String,
    required: true,
  },
  studentId: {
    type: String,
    required: true,
  },
  teacherId: {
    type: String,
    required: true,
  },
  classStudies: {
    type: Number,
    required: true,
  },
  location: {
    type: String,
    required: true,
  },
  note: {
    type: String,
    required: false,
  },
});
module.exports = mongoose.model("Offer", offerSchema);
