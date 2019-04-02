## Mod 2 - How the hell do servers even?

### Objectives

* Pick up from yesterday by finishing our homepage
* Recognize MVC as an architectural pattern
* Learn how to perform the standard CRUD operations
  * What are they again?
* Encounter Forms at the nexus of MVC 😎

REMINDER: verb + path == route


#### More behavior - CRUD

* Viewing an individual book. This should be quick.
* Creating a book. This is big! Rest of lecture. :)
* Editing and Deleting would be nice. Maybe today, maybe not.
  * Y'all can tell me to speed up or slow down. Don't get bored!


#### Why are forms hard?

* Well, they rely on _every part_ of MVC.
  * It relies on the model, for us to know what fields and inputs we need data for.
  * It relies on the controller/routes, for us to know where the form should be sent for processing.
  * It _is_ a view, and the way we define the inputs *determines how the controller sees the data*!

Also, somewhat surprisingly, a form is always split up between two routes:
  * One route sends the HTML for the page that displays the form
  * The other route receives the information in the form and processes it

We will get much more practice with this. Forms are hard but _so_ important.
