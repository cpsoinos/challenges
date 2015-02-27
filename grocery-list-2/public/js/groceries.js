function noItem() {
  $("#submit").on("click", function() {
    var $grocery_item = ($("#grocery_item").val());
    if ($grocery_item === "") {
      event.preventDefault();
      alert("No item!");
    }
  })
}

noItem();
// if($("#grocery_item").val() === "") {
//   noItem();
// }

// var $item = $.get("groceries.last")
