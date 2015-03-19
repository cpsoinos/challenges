$(function() {
  var page = 2;
  $(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() == $(document).height()) {

      $.ajax( {
        type: 'get',
        dataType: 'json',
        url: '/tweets.json?page=' + page,
        success: function(data) {
          page +=1;
          data.forEach(function(tweets) {
            var $newTweetText = "<div class='body'>" + tweets.text + "</div>";
            var $newTweetUser = "<div class='user'>" + tweets.username + "</div>";
            var $appendMe = "<li class='tweet'>" + $newTweetText + $newTweetUser + "</li>";

            $(".tweets").append($appendMe);
          });
        },
        failure: function(data) {
          alert('didnt work');
        }
      });
    }
  });
});
