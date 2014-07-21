sms-scrabble-cheater
====================

A Sinatra app that works with Twilio to assist users find dictionary words using brute force. 

This application requires setting up an account at Twilio and a place to host the app like Heroku

See blog post http://nick-aschenbach.github.io/blog/2014/07/20/text-messaging-made-easy-with-twilio/

First bundle the app:

```
bundle
```

Then run it:

```
ruby word_finder.rb
```

The app can be opened up in a browser. To find permutations for a word send search letters in the query string:

```
localhost:4567?Body=foobar
```

The XML response payload should appear as follows:

```
<Response>
<Message>
Permutations for foobar: fa of oo ob or bo ba ar fob for fab far fro oof oor obo oba oaf oar orf orb boo boa bor bar bro bra arb roo rob forb fora faro frab boor boar bora barf broo afro roof
</Message>
</Response>
```
