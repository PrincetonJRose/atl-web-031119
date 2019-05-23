import React from 'react';
import DogList from './DogList'
import DogDetail from './DogDetail'
import DogForm from './DogForm'

import { Switch, Route } from 'react-router-dom';

class DogContainer extends React.Component {

  state = {
      dogs: []
  }

  componentDidMount() {
    fetch("http://localhost:3000/dogs")
      .then(res => res.json())
      .then(json => this.setState({ dogs: json }))
  }

  addDog = (dog) => {
    let newDogList = this.state.dogs.concat(dog)
    this.setState({ dogs: newDogList })
  }
  // <DogForm addDog={this.addDog} />
  // let currentDog = this.state.dogs.find(x => x.id === currentDogId)
  // <DogDetail dog={currentDog} />


  render = () => {
    return (
      <div className="ui grid container">
        <DogList
          width="six"
          dogs={this.state.dogs}
        />
        <Switch>
          <Route path="/dogs/new" component={() => {
            return <DogForm addDog={this.addDog} />
          }} />
          <Route path="/dogs/:id" component={(props) => {
            let dogId = parseInt(props.match.params.id)
            let currentDog = this.state.dogs.find(d => d.id === dogId)
            return currentDog ? <DogDetail dog={currentDog} /> : null
          }} />
        </Switch>
      </div>
    )
  }
}

export default DogContainer;
