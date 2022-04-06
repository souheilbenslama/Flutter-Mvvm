// Globale middlewares

// Packages
const multer = require('multer');
const fs = require('fs');
const sharp = require("sharp");

// Prepare functions

//Storage (location - filename)
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './images')
    },
    filename: function (req, file, cb) {
        cb(null,  Date.now().toString() + '_' + file.originalname)
    },
})

//Check File Type
function checkFileType(file, cb){
    // Allowed ext
    const filetypes = /jpeg|jpg|png/;
  
    // Check mime
    const mimeType = filetypes.test(file.mimetype);
  
    if(mimeType) {
      return cb(null,true);
    } else {
      cb('Images seulement!');
    }
  }

//Middleware Multer for files uploading
const upload = multer({
    storage: storage,
    limits: {fileSize: 500000},
    fileFilter: function(req, file, cb){
       checkFileType(file, cb)
    }
}).single("avatar");




// Capture the file and treat it 
const hasFile = function (req, res, next) {
    upload(req, res, async  (err) => {
        if(err) {
            return res.status(403).send(err);
        }

        if(req.file) {
            const filepath = Date.now().toString() + '_' +req.file.originalname
            await sharp(req.file.path)
               .resize(300)
               .toFile(`./images/${filepath}`)
        
                //Delete non resized avatar
                fs.unlink(req.file.path, () => {})  

                req.file = 'images\\'+filepath
          }
          
        next();
    })
}

// Exportation
module.exports = { hasFile }