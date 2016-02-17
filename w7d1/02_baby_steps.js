

function addNumbers(array){
  var sum = 0;
  for (var i = 2; i < array.length; i++) {
    sum = sum + Number(array[i])
  }
  return sum
}

console.log(addNumbers(process.argv));