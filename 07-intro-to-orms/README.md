# Intro to ORMs (Object Relational Mappers)

# CRUD REVIEW

### What is an ORM?

* Library for accessing a database.
  * Classes correspond to tables,
    instances are rows.
  * To build one, you probably need metaprogramming.
  * It should allow us to do all standard CRUD.

### Why do you want one?

* Allows me to have persistent data.
* I can write object oriented code that interacts with SQL.

A tweet belongs to a user and has some message content - must have user_id

The belongs_to must have a user_id on it

A user has a username, and has many tweets

A tweet can have many tags and a tag can have many tweets
