var player = {
  name: 'player 1',
  guess: 0,
  bank: 20,
  bet: 0,
};

var answer = Math.floor(Math.random() * 10).toString();

function printBank() {
  $('#bank').text("Player's Bank: " + player.bank);
}

function printAnswer() {
  $('#answer').text("Answer was: " + answer);
}

function newAnswer() {
  answer = Math.floor(Math.random() * 10).toString();
}

function verifyGuess(guess, answer) {
  closeAnswer = answer - 1;
  closeAnswer2 = answer + 1;
  if (guess == answer) {
    console.log('answer is right, you win your bet!')
    player.bank = player.bank + player.bet;
  }
  else if ((guess == closeAnswer) || (guess == closeAnswer2)) {
    console.log('answer is close! no money lost!');
  }
  else {
    console.log('LOL YOU SUCK, lose money')
    player.bank = player.bank - player.bet;
  };
}


$('.submit-button').on('click', function() {
    player.guess = parseInt($('.guess').val());
    player.bet = parseInt($('.bet').val());
    verifyGuess(player.guess, answer);
    printBank();
    printAnswer();
    newAnswer();
    console.log('player bet', player.bet, typeof(player.bet));
    console.log('playe guess', player.guess, typeof(player.guess));
  });