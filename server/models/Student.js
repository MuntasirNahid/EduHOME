const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const studentSchema = new Schema({
  fullName: {
    type: String,
    required: true,
    min: 2,
    max: 50,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },

  classStudies: {
    type: String,  //change it 
    required: true,
  },
  location: {
    type: String,
    required: true,
    max: 50,
  },
  phoneNumber: {
    type: String,
    required: true,
    min: 6,
    max: 12,
  },
  picturePath: {
    type: String,
    default: "",
    required: false,
  },
  institution: {
    type: String,
    default: ""
  },
  teacherId: {
    type: Array,
    //required: true,
    default: [],
  },
  advertisementId: {
    type: Array,
    default: [],
  },
});

module.exports = mongoose.model("Student", studentSchema);
