const jwt = require("jsonwebtoken");

// Verify the token 
const  hasToken = function (req, res, next) {
    let token = req.headers.token;
    jwt.verify(token, "INSAT", (err, decoded) => {
        if (err)
        return res.status(401).json({
          title: "unauthorized",
        });

        //Save Token informations inside req.user
        req.decoded = decoded
        return next()
    })
}

module.exports = {
    hasToken
}