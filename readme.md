# Share Links

A simple, locally hosted, web app to easily share links. Primary use is to share links with my wife. Everything should be commented pretty well. If you have questions feel free to ask.

## Purpose / Use

The idea is to run this locally at home in order to share links between my wife and myself. Since there are only two people in the system, there are some liberties taken.

* No "authentication" - there is a very simple sign in mechanism on the home page
* No scoping of links - everyone in the system can see all links
* Archive requires everyone - in order to "archive" a link, everyone in the system has to archive that link.
* Simple validation - There is very simple and basic validation. For example, I check just for the presence of a url, not that it is actually a url.

## To get started

~~~
$ bundle
$ rake db:reset
~~~

Reset will run the migration and see the database. You might want to change the seed file before you do this so the two users have better names than "User 1" and "User 2".

> If you are using rbenv and it throws an error about the right version, feel free to delete `.rbenv-version`.

## To run tests

~~~
$ guard
~~~

## Google Fonts

[Bookmark for reference](http://www.google.com/webfonts#UsePlace:use/Collection:Cantarell:400,400italic|Playfair+Display+SC:400,900,700)
