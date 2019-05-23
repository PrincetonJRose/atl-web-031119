import React from 'react';

class DogForm extends React.Component {
  state = {
    image_url: "",
    name: "",
    age: "",
    description: "",
    likes: 1,
    adopted: false,
    errors: []
  }

  saveDog = (event) => {
    event.preventDefault()
    fetch("http://localhost:3000/dogs", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Access-Token": localStorage.getItem("token")
      },
      body: JSON.stringify(this.state)
    }).then(res => res.json())
    .then(json => {
      if (json.errors) {
        this.setState({ errors: json.errors })
        console.log("oops, didn't work")
      } else {
        this.props.addDog(json)
      }
    })
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

  render = () =>
    <form class="ui form" onSubmit={this.saveDog}>
      { this.displayErrors() }
      <div class="field">
        <label>Name</label>
        <input type="text" name="name" placeholder="Name"
          onChange={(e) => this.setState({ name: e.target.value })} />
      </div>
      <div class="field">
        <label>Image URL</label>
        <input type="text" name="image_url" placeholder="Image URL"
          onChange={(e) => this.setState({ image_url: e.target.value })} />
      </div>
      <div class="field">
        <label>Likes</label>
        <input type="number" name="likes" placeholder="1"
          onChange={(e) => this.setState({ likes: e.target.value })} />
      </div>
      <button class="ui button" type="submit">Submit</button>

    </form>
}

export default DogForm;
