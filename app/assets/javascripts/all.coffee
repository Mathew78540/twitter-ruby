###
 Extact # and Account from tweet text
###

extract = (text, symbol) ->
  hashtag = ''
  iterate = text.split('')
  iterate.forEach  (letter) -> hashtag += letter if letter != symbol
  return hashtag


parsingTweet = (tweet) ->
  return tweet.split(' ').map( (text) ->
    if text[0] == "#"
      hashtag = extract(text, "#");
      text = "<a href='/hashtag/#{hashtag}'>#{text}</a>"
    else if text[0] == "@"
      username = extract(text, "@");
      text = "<a href='/account/#{username}'>#{text}</a>"
    return text;
  ).join(' ');

tweets = document.querySelectorAll '.tweet .text'

[].forEach.call tweets, (tweet) -> tweet.innerHTML = parsingTweet tweet.innerHTML


###
  Send Like to a tweet
###

###
  Flash
###

flash = document.getElementById('flash');

setTimeout( () ->
  if flash then flash.classList.add('hide_anim')
, 3000)
