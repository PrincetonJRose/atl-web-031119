## Full Stack Authentication

### Objectives

* Once I'm logged in I should stay logged in.
* Anyone can view dogs or the about page.
* Should be able to logout if logged in and vice versa.

TODO:
* Only shelter staff should be able to add dogs.
* Only logged in users can see or submit the form.
* Maybe we can add a profile page. 😎

#### Morning Lecture - Rails focused

What are the backend parts we need?
  * as before: bcrypt and `has_secure_password` for _pw storage_
  * new: JWT for encrypting data to send to the browser
    * a secret key for JWT
    * a way to store the secret safely (.env / dotenv-rails)
  * changed: `current_user` and `authorize!` methods
    * `current_user` should now check the request headers
      for a JWT token to decode
    * `authorize!` should render json if there is no user

#### Afternoon Lecture - React focused

What are the frontend parts we need?
  * login form component
  * maybe a backend service file for API fetches
  * localStorage!
  * attaching headers to future requests
  * a CheckLogin _higher order component_ to prevent
    accessing certain pages without a token

### High-Level Reminders

* The Point of authentication is for the server to know who sent a request.
* Authorization is separate from authentication.
* Authentication is about identity, "Who are you?"
* Authorization is about access control, "Can you do that?"

## Rails Authentication Review

### bcrypt

We don't want access to the passwords
Liability - if we have that access, that's dangerous

- password storage (hashed, salted passwords)
  - _hashed_ ('one way' function, can't recover the original value)
  - _salted_ - add random string to the password 'password123' + 'aslkdfjalskdfjkasjdf'
  - protects against Rainbow Table attack

- column `password_digest` instead of password
- `has_secure_password` macro adds before_save to hash passwords and `authenticate` method
- password doesn't get stored in plaintext

### /login

- route accepts the username and password
- `@user.authenticate(params[:pass])`
- start a "session" or "bad credentials"
- send back a _cookie_ with the session info
- cookie can be used instead of username / password in the future

```ruby
# /login
session[:user_id] = current_user.id # set an encrypted cookie

# later
session[:user_id] # read from the cookie
```

### Authorization Review

- based on the session info
- `before_action :authenticate`
- check whether the user was 'Authorized' to access some resource / perform some action
- either allow or respond with some error

**Gems:**
- Devise (maybe don't use this?)
- CanCanCan
- Pundit

### What's changed?

* Browser still needs to get some identifying info to store.
  * But we won't use cookies because `fetch` won't send cookies along with it.
  * We'll use `localStorage`! [localStorage][local-storage]
  * We'll add a login form and use fetch to send a login request to the Rails API
  * Rails will send back JSON with a secret key which we'll save in localStorage
  * Then, on any requests where we need to be "signed in", include the secret key in headers!
  * Rails can have a `current_user` method that looks in headers to see if there's a valid key and finds the user

[local-storage]: https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage

### Token
- identifies user
- _Cryptographically Secure_
  - protection from eavesdropping - no one can read the data
  - protection from tampering - signed, no one can forge a signature

### JWT
- format for tokens
- allows different encryption schemes
- libraries in different languages for creating them

### Flow
- ☑️ user presented with a login form
- sends the email + password to rails (fetch)
- rails sends back "token" - contains identifying info
- react includes the token with future requests to prove that it's still the user
- rails checks the token and authorizes based on that info

**Options for storing the token:**
  - Cookies (how we did it in rails)
    - Don't have the control in our app
  - React state - cleared out every time we refresh
  - Url in react-router
    - don't do this!!!
    - sharing a link shares someone's identity!
  - localStorage
    - be there forever?
      - clear it - on sign out `clear`
      - we would like to be able to expire tokens after a set amount of time
      - 'stay signed in'
      - XSS - Cross Site Scripting

### User Experience

#### Logout
- Button in navbar
- clear localStorage
- update the state so that it reflects that we are logged out

#### Sign up / Login
- error messages for invalid email / password, failed token
- Redirect on login

### In rails...
JWT Gem
1. Sign a JWT token in Rails
  -> encode some data
2. Send it to react app (when the react app sends the username and password)
3. React app sends it back (store it, send it with the request)
4. Rails checks validity
-> because of JWT, we can trust that Rails app originally created the data

In summary:
- Rails has a secret key
- lock some information with that key
- Send it out, trust that no one else can read it
- Read it again, trust that no one else can tamper with it

### In React...

#### Sign In
1. Login Form
2. Send the username and password
  * What about displaying errors for incorrect login?
  * console.log the json. either add "error" state or conditionalize.
3. Store the token (and user info)
  * Probably use react-router history.push to go to "next page".
  * Might need to use withRouter... [withRouter](https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/withRouter.md)
4. Fix create endpoint on restcue-API to be authenticated
  * Try to add a dog without token, it should fail!
    * Potentially talk about `.catch`? Eh, or not.
  * Add the token and a current_user method to restcue-API.
5. Probably use <Redirect> if trying to render DogForm without user
6. We could add a profile page if we want.

#### Already Signed In
1. On mount, check if there is a token
2. If so, fetch user info
3. If not...

### Questions
- How to hide your secret key?
-> env

- Is React State secure?
-> As safe as any other javascript executing in the browser
-> XSS is a big vulnerability :/

- Other attack vectors? Liabilities?
-> Scrub your logs
