@fetchTweets = () ->
  $.ajax
    url: $("[data-tweets-path]").data("tweets-path"),
    type: 'get',
    dataType: 'json',
    success: (data) ->
      for tweet in data
        tweet.text = twttr.txt.autoLink tweet.text
        li = ich.tweet(tweet)
        if $("li#" + tweet.external_id).length == 0
          $("ul[data-tweets-path]").prepend li
      setTimeout("fetchTweets()", 2000)

$ ->
  if $("[data-tweets-path]").length
    fetchTweets()