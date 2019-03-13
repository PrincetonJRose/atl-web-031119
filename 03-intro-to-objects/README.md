# Intro to Object Orientation

## Objectives

* Define `object` in programming domain
* Explain the concept of sending messages
* Create a class and instantiate an instance of the class
* Explain the difference between a class and an instance
* Pass arguments to `new` by defining an initialize method in class
* Create instance methods
* Call methods on the implicit or explicit `self`
* Explain the need for variable scope and why it's important to not utilize global variables

## Whiteboard Exercise: 5 classes and instances

classes | instances
===================
String  | "cookies"
Fixnum  | 42
Float   | 7.9
Array   | [1,2,3]
Hash    | { brit: 'awake?' }

classes are like:
* a field with constraints
* an operator's manual
* a blueprint

## Deliverables

Here is a naive implementation of a bank account in Ruby using only a hash which stores key-value pairs.

```ruby
bank_account = {"user_id": 3, "balance": 100}
```

Write an implementation of a bank account that meets the following requirements:

* can print the balance of the account
* can deposit money into the account
* can withdraw money from the account
* keeps track of the account number
* keeps track of the customer id of the account
