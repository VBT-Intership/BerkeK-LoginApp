var User = require("../models/User");

/// This method list all users.
exports.getAllUsers = (req, res, next) => {

    User.find().then((developers) => {
        res.json(developers);
    });
}

/// This method add a new user with post request
exports.addNewUser = (req, res, next) => {

    new User({
        username: req.body.username,
        password: req.body.password
    }).save().then(() => {
        res.json("Successful!");
    }).catch((err) => {
        res.json("Error");
    });

}

/// This method is login operations
exports.loginUser = (req, res, next) => {

    var username = req.body.username;
    var password = req.body.password;

    User.find({username: username, password: password}).then((developers) => {
        if(developers != null){
            res.json(developers);
        }else{
            res.json("Error");
        }
    });
}