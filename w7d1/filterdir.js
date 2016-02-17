// var fs = require('fs');
// var dir = process.argv[2];
// var ext = "."+process.argv[3];
// var path = require('path');

// fs.readdir(dir, function(err,list){
//   for (var i=0;i<list.length;i++){
//     if ((path.extname(list[i]))===ext){
//     console.log(list[i]);
//   }
// }
// });

var fs = require('fs')

module.exports = function (dir, filter, cb) {

  var extFilter = new RegExp('\\.' + filter + '$')

  var result = []

  fs.readdir(dir, function (err, list) {
    if (err){
      return cb(err)
    }
    list.forEach(function (item) {
      if (extFilter.test(item)){
        result.push(item)
      }
    })
    cb(null, result);
  })
}