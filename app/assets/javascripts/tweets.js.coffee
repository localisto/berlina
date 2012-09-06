@fetchTweets = () ->
  $.ajax
    url: $("[data-tweets-path]").data("tweets-path"),
    type: 'get',
    dataType: 'json',
    success: (data) ->
      for tweet in data
        tweet.text = twttr.txt.autoLink tweet.text
        tweet.created_at = $.format.date(tweet.created_at, "MMMM d, yyyy h:mm a")
        li = ich.tweet(tweet)
        if $("li#" + tweet.external_id).length == 0
          $("ul[data-tweets-path]").prepend li
      setTimeout("fetchTweets()", 2000)

@fetchRandomTweet = () ->
  $.ajax
    url: $("[data-random-tweets-path]").data("random-tweets-path"),
    type: 'get',
    dataType: 'json',
    success: (tweet) ->
      tweet.text = twttr.txt.autoLink tweet.text
      tweet.created_at = $.format.date(tweet.created_at, "MMMM d, yyyy h:mm a")
      li = ich.tweet(tweet)
      $("div[data-random-tweets-path] ul").find("li").fadeOut "fast", ->
        $(this).remove()
        $("div[data-random-tweets-path] ul").prepend(li).hide().fadeIn("fast")
        setTimeout("fetchRandomTweet()", 5000)

$ ->
  if $("[data-tweets-path]").length
    fetchTweets()
  if $("[data-random-tweets-path]").length
    fetchRandomTweet()