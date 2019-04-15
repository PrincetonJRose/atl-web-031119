## Rails Authentication

## Step by Step(ish)

1. Hmm, any user can edit or delete any pet!
  * Add a password column!
  * Let's add a login form (in a SessionsContoller?)
    * NOTE: Not necessarily RESTful. A Person is a model but a Session isn't!
    * NOTE: The devise gem can generate a lot of this for us but you shouldn't use it! Won't help with APIs, won't help with non-standard models (Person instead of User), etc.

  * Q: What problem does login solve?
    * ???



    * What does persistent mean? Is login persistent?
    * What forms of persistent storage do we know?
    * Important notes on _session_:
      * Stored by cookies so...
      *

2. Track `user_id` in the session on successful login.

3. Display the current user in the layout. Add sign_in/sign_out links.

4. The two most common things the server will want to do are figure
   out who is making the current request and making sure a user is
   logged in to be able to view certain pages. Let's add methods to
   help with that!
   * common goals:
     * 1) know who's logged in or if someone is logged in?
       * solved by `current_user`
       * but can even have a `logged_in?` method if you like
     * 2) preventing someone from going to a page unless they're logged in
       * shouldn't be able to add post unless logged in
       * `before_action :authorize!`
     * 3) keeping someone from messing with data that's not theirs
       * `if current_user == object.user_id`

5. Protect appropriate methods with a `before_action`.

6. Our password storage practices are bogus. Let's do a little better with `bcrypt`!
  * (and [`has_secure_password`][hsp])
  * we should remove our password column and
    add a `password_digest` column here
  * and update the LoginController to use `authenticate`

[hsp]: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
