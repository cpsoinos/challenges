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
  $("#guess").val("");
});

function validateGuess($guess) {
  var analysis = [$guess];

  if ($guess > 100) {
    analysis.push(" isn't between 1-100! Try again.")
  } else if (isNaN($guess)) {
    analysis[0] = "That";
    analysis.push(" is not a valid number. Try again.")
  } else if ($guess > theNumber) {
    analysis.push(" is too high.")
  } else if ($guess < theNumber) {
    analysis.push(" is too low.")
  } else {
    analysis.push(" is correct!")
  };

  return analysis;
}

$(".reset").on("click", function(event) {
  theNumber = getRandomInt(1, 101);
  $(".analysis-message").empty();
  $("#guess").val("");
})
