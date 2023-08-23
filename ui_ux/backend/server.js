require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");
const studentRoutes = require("./routes/studentRoutes");
const teacherRoutes = require("./routes/teacherRoutes");
const Student = require("./models/Student");

const Advertisement = require("./models/Advertisement");
const Teacher = require("./models/Teacher");
const Offer = require("./models/Offer");

//express app
const app = express();

//middleware
app.use(express.json());

//routes
app.use("/api/student", studentRoutes);
app.use("/api/teacher", teacherRoutes);

//connect to db
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    app.listen(process.env.PORT, () => {
      console.log("connected to db & listening on port", process.env.PORT);
    });
  })
  .catch((error) => {
    console.log(error);
  });
