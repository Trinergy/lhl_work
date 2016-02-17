var fs = require('fs');

var arg = process.argv[2];

fs.createReadStream(arg).pipe(process.stdout);
