var fs = require('fs');

var file = process.argv[2];

var lines;

function countLines(callback) {
  fs.readFile(file, function doneReading(err, fileContents) {
    lines = fileContents.toString().split('\n').length-1;
    callback();
  })
}

function logLines(){
  console.log(lines);
}


countLines(logLines)

