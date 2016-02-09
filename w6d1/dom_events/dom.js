

$('.key-test').on('keyup', function() {
  console.log('HELL YA');
});

$('.key-test2').on('keypress', function() {
  console.log('HELL YA');
});
// keypress only registers characters
// keyup registers shift and delete keys
// tab does not register for either