import React from 'react';

class DogForm extends React.Component {
  state = {
    image_url: "",
    name: "",
    age: "",
    description: "",
    likes: 1,
    adopted: false
  }

  saveDog = (event) => {
    event.preventDefault()
    fetch("http://localhost:3000/dogs", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(this.state)
    }).then(res => res.json())
    .then(json => {
      if (json.errors) {
        console.log("oops, didn't work")
      } else {
        this.props.addDog(json)
      }
    })
  }

  render = () =>
    <form class="ui form" onSubmit={this.saveDog}>
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
