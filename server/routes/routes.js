"use strict";

module.exports = function (app) {
    //Import routes
    const accountRoutes = require("./accountRoutes");
    const vaccineRoutes = require("./vaccineRoutes")

    // Groupe routes
    const routes = [
        accountRoutes,
        vaccineRoutes
    ]

    //Use
    app.use(routes)
};
