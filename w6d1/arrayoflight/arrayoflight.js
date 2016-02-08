function arrayOfLight(x) {
  result = [];
  for (i = 0; i < (x + 1); i++) {
    result.push(i);
  };
  return result;
};

console.log(arrayOfLight(5))