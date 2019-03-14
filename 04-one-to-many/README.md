## Morning!


## Recap

Brief recap! Yesterday we saw:

* Classes
* Instances
* Value Equality vs Pointer Equality (object identity)
* Methods and method dispatch
* Instance Variables
* Self

[how's your brain feelin?](https://camo.githubusercontent.com/8686c5147a4b736241bc598f0b7531220d58688b/687474703a2f2f692e696d6775722e636f6d2f3461573879617a2e676966)






## Today

Cool! Next we're going to:

* Dive deeper into self
* See attr_ macros
* Try to model relationships between objects (a person and their pets)
  * Maybe we'll meet these chuckleheads: http://redlinernotes.com/images/puppers.jpg
* Learn about class variables and class methods
  * Note: These are _basically_ global state since classes have Global scope.
  * In production use they are often frowned upon, here we are using them as a stand in
    until we can introduce Relational Databases next week... :)

And I still haven't gotten to talk about Enumerables and blocks as much
as I'd like. ... Damn.

Step 1:

* Practice writing classes: A Person class and a Pet class
  * What can they do?
  * How do we `require` both classes so we can use them together?
  * What relationships do trainers have to our other classes?

* Who is in charge of knowing about the relationship between a person and a pet?
  * What do we do if there are two owners with the same name?
  * Is there a way we can we tell them apart or make them unique?
