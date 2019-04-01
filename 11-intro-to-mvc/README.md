## Mod 2 (a preview) - 5 minutes

### Week 1

* Learn about HTTP, Requests and Responses
* Learn basics of Routing
* Learn how to write methods to _Respond_ to a _Request_
* Learn how to build views with HTML templates
* Learn how to construct Forms and handle Params

### Week 2

* Take all the above concepts and see how to use them in Rails
* Pick up some nice Rails helpers to make our lives easier
  * Fall back on "the simple way" if Rails isn't making things easier

## Today

### To Build...

A tiny library.

* make a wonderful homepage
* list all the books
* get info on a single book

### Concepts

* MVC
* HTTP (Requests and Responses)
* Routes
* ERB
* Params?

### Getting Familiar with HTTP

* View http://blog.kingcons.io in browser
* `curl http://blog.kingcons.io`
  * now do it with -v
* inspect the Network tab. wow! same thing!
* NOTE: there are other HTTP _verbs_ besides GET
  ... but we'll get to them tomorrow :)
* Important question: What happens after a response is sent?

#### Parts of a Request
- Verb
- Path
- Headers
- Body (optional)

#### Parts of a Response
- Status Code
- Headers
- Body

### Intro to Sinatra

What's the purpose of Sinatra? What does it do for us?

* Connects a set of routes to methods to generate a response
* I.e. It builds a routing table and uses that to answer each request.

Here's the plan:


* Tour of a sinatra app


* How do we connect actions in our app to pages?
  * Routes connect actions in our app to pages!
  * Example of a route: `GET '/good_doggos'`
    * A _Controller method_ is a snippet of code that runs to
      build the response for a _specific route_.
    * Routes and handlers together tell us how to generate them
      response for a specific request.


* How do communicate between our controller and our view?
  * ERB? Ahhhh. (Don't worry. It's just a templating language.)
  * A template is just a fancier version of string interpolation.
    * String interpolation lets us run snippets of code to fill in parts of a string.
    * Templates exist because we want to customize really big complicated strings. Like web pages! So we take the string and just stuff it in its own file.
  * So, what variables/methods are in scope in a view? 🤔🤔🤔


* What is the core idea of MVC?
  * Model-View-Controller, an architectural pattern
  * Splits the responsibility of our app up:
    * Models: manage the data
    * Controllers: that have the application logic
    * Views: that present an interface to the user
  * Code can easily get too messy if these are in the same file,
    let alone the same method. So break them into different parts!
