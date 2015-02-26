$("#get-dish").on("click", function() {
  $.get("/new-dish.json", function(newDish) {
    alert(newDish["dish"]);
  });
});

var dish = $.get("/new-dish.json")
