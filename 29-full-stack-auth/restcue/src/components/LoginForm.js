import React from 'react';

class LoginForm extends React.Component {
  state = {
    email: '',
    password: '',
    errors: []
  }

  displayErrors = () => {
    if (this.state.errors.length > 0) {
      debugger;
      return (
        <div className='form-errors'>
          <p>Form Errors</p>
          <ul>
            { this.state.errors.map(msg => <li>{msg}</li>) }
          </ul>
        </div>
      )
    } else {
      return null;
    }
  }

  handleSubmit = (e) => {
    e.preventDefault()
    fetch("http://localhost:3000/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(this.state)
    }).then(res => res.json())
    .then(data => {
      if (data.errors) {
        this.setState({ errors: data.errors })
      } else {
        localStorage.setItem("token", data.token)
        this.props.history.push("/")
      }
    })

  }

  render = () =>
    <form class="ui form" onSubmit={this.handleSubmit}>
      { this.displayErrors() }
      <div class="field">
        <label>Email</label>
        <input type="text" name="email" placeholder="Email"
          onChange={(e) => this.setState({ email: e.target.value })} />
      </div>
      <div class="field">
        <label>Password</label>
        <input type="password" name="password" placeholder="Password"
          onChange={(e) => this.setState({ password: e.target.value })} />
      </div>
      <button class="ui button" type="submit">Submit</button>

    </form>
}

export default LoginForm;
