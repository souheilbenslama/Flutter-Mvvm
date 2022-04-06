'use strict';

var mongoose = require('mongoose');

const Vaccine = mongoose.model('Vaccine');

// List vaccines
exports.list_vaccines = function (req, res) {
  Vaccine.find(req.body).exec((err, Vaccines) => {
    if (err) res.send(err);
    res.json(Vaccines);
  });
};


// Create vaccine
exports.create_vaccine = async (req, res) => {
  var new_vaccine = new Vaccine({
    name: req.body.name,
    time: req.body.time,
    date: req.body.date,
    place: req.body.place,
    account: req.body.account,
  });

  //Saving vaccine
  new_vaccine.save(function (err, vaccine) {
    if (err) res.status(400).send(err);
    res.status(200).json(vaccine);
  });
};

// Read Vaccine by ID
exports.read_a_vaccine = function (req, res) {
  //Find Vaccine by ID
  Vaccine.findById(req.params.vaccineId).exec((err, vaccine) => {
    if (err) res.status(400).send(err);
    res.status(200).json(vaccine);
  });
};

//Delete Vaccine
exports.delete_vaccine = function (req, res) {
  Vaccine.findOneAndRemove({ _id: req.params.vaccineId }, function (err, vaccine) {
    if (err) res.status(400).send(err);

    return res.status(200).json(vaccine);
  });
};