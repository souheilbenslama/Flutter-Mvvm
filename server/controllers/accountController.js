"use strict";

var mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const Account = mongoose.model("Account");

//Sign Up and account per type
exports.create_account = function (req, res) {

  if(!req.body.email || !req.body.password) {
    return res.status(400).json({
      title: "error",
      error: "missing data",
    });
  }

  var newAccount = new Account({
    email: req.body.email,
    password: bcrypt.hashSync(req.body.password, 10),
    name: req.body.name,
    birthdate: req.body.birthdate,
    address: req.body.address
  });

  newAccount.save((err) => {
    if (err) {
      return res.status(400).json({
        title: "error",
        error: "email in use",
      });
    }
    return res.status(200).json({
      title: "signup success",
    });
  });
};

// Login process
exports.login = function (req, res) {
    Account.findOne({ email: req.body.email }, (err, account) => {
      if (err)
        return res.status(500).json({
          title: "server error",
          error: err,
        });
  
      //Verify account existance
      if (!account) return res.status(400).json({
        title: "Utilisateur n'existe pas",
        error: "invalide credentials",
      })  
      
      //incorrect password
      if (!bcrypt.compareSync(req.body.password, account.password)) {
        return res.status(400).json({
          title: "Mot de passe est incorrect",
          error: "invalid credentials",
        });
      }
      //IF ALL IS GOOD
      let token = jwt.sign({ accountId: account._id, type: 'user' }, "INSAT");
      return res.status(200).json({
        token: token,
        user: account
      });
    });
  };

  //Get account by JWT token
exports.get_account = function (req, res) {
    // Token verification
    let token = req.headers.token;
    jwt.verify(token, "INSAT", (err, decoded) => {
      if (err)
        return res.status(401).json({
          title: "unauthorized",
        });
      //token is valid
      Account.findOne({ _id: decoded.accountId }, (err, account) => {
        if (err) return res.status(403).send(err);
        return res.status(200).json({
          title: "user grabbed",
          account: account,
        });
      });
    });
  };

  //Update account
exports.update_account = function (req, res) {
    //Token verification
    let token = req.headers.token;
    jwt.verify(token, "INSAT", (err, decoded) => {
      if (err)
        return res.status(401).json({
          title: "unauthorized",
        });
      
      //token is valid
      Account.findOneAndUpdate(
        { _id: decoded.accountId },
        req.body,
        {new:true},
        (err, account) => {
          if (err) return res.status(403).send(err);
          return res.status(200).json({
            title: "user Updated",
            account: account,
          });
        }
      );
    });
  };

  // Update Password
exports.updatepwd = function (req, res) {
  //Token verification
  let token = req.headers.token;
  jwt.verify(token, "INSAT", (err, decoded) => {
    if (err)
      return res.status(401).json({
        title: "unauthorized",
      });
      
      Account.findOne({ _id: decoded.accountId }, (err, account) => {
        if (err) {
          return res.status(500).json({
            title: "server error",
            error: err,
          });
        }
        //incorrect password
        if (!bcrypt.compareSync(req.body.oldpassword, account.password)) {
          return res.status(400).json({
            title: "Password Reset failed",
            error: "Password incorrect",
          });
        }
        else{
        //Correct password
        const pwd = bcrypt.hashSync(req.body.password, 10)
        Account.findOneAndUpdate(
          { _id: decoded.accountId },
          {password: pwd},
          (err, account) => {
            if (err) return res.status(403).send(err);
            return res.status(200).json({
              title: "Password updated",
              account: account,
            });
          }
        );
        }
      });
  });
};