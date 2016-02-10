var player = {
  name: 'player 1',
  guess: 0,
  bank: 20,
  bet: 0,
}


player.name = prompt('What is your name?')

alert('Hello ' + player.name + ', I am thinking of a number from 1-10, please place your bet then guess my number')

function getBet() {
  bet = null;
  bank = player.bank
  while (bet < 5 || bet > 10 || bet > bank) {
    bet = parseInt(prompt("What is your bet? (between 5 and 10) Bank: " + bank))
  };
  return bet;
}

function getGuess() {
  guess =null;
  while (guess > 10 || guess < 1) {
    guess = prompt("Guess a number between 1 and 10");
  };
  return guess;
}



while (player.bank > 0) {
  answer = Math.floor(Math.random() * 10).toString();
  closeAnswer = (answer - 1).toString();
  closeAnswer2 = (answer + 1).toString();
  console.log(answer);
  player.bet = getBet();
  player.guess = getGuess();
  switch(player.guess) {
    case answer:
      alert("Congrats! you guessed the number right, your bank has increased by " + player.bet + ".");
      player.bank = player.bank + player.bet;
      break;
    case closeAnswer:
      alert("Darn! you were close, your bank stays the same.");
      break;
    case closeAnswer2:
      alert("Darn! you were close, your bank stays the same.");
      break;
    default:
      alert("You SUCK!! LOLOLOLOLOL, your bank decreased by " + player.bet + ".");
      player.bank = player.bank - player.bet;
  };
}