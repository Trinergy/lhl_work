var dir = process.argv[2]
var ext = process.argv[3]

require('./filterdir')(dir, ext, function (err, data) {
  if (err) {
    return console.error(err)
  }

  data.forEach(function (item) {
    console.log(item);
  })
})