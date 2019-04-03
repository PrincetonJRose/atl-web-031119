## Mod 2 - How the hell do servers even?

### Objectives

* Mention the other RESTful routes.
* Engage our brains with an example of a non-RESTful route: search.
* Look at relationships in a webapp... organizing books by Author.

### Deliverables

* First, we need a new model: Author.
* Next, we should fix books to have a relationship with authors.
  * A data preserving migration maybe?
* Now, our boss wants to be able to see a list of books by author.
  * Maybe factor out an AuthorsController and BooksController?
* Finally, he's asked to have a page where we can add an author and some of their books.
  * Whoo boy... How do we send an _array_ from a form?
