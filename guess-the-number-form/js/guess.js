function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
};

var theNumber = getRandomInt(1, 101);
var $guess = 0;

console.log(theNumber);

$("#guess-form").on("submit", function(event) {
  event.preventDefault();
  $guess = parseInt($("#guess").val(), 10);

  var analysis = validateGuess($guess);
  var $results = $('<li>').text(analysis[0] + analysis[1]);

  $(".analysis-message").prepend($results);
});

function validateGuess($guess) {
  var analysis = [];

  if ($guess > theNumber) {
    analysis.push($guess, " is too high.")
  } else if ($guess < theNumber) {
    analysis.push($guess, " is too low.")
  } else {
    analysis.push($guess, " is correct!")
  };

  return analysis;
}
