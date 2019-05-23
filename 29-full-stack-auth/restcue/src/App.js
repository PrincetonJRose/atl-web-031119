import React, { Component } from 'react';
import './App.css';
import Navbar from './components/Navbar'
import DogContainer from './components/DogContainer'
import AboutUs from './components/AboutUs'
import { Switch, Route } from 'react-router-dom'

const App = (props) => {
  let desc = "A Shelter for only the best Doggos"
  return (
    <div className="App ui container">
      <Navbar color="teal" icon="paw" title="RESTcue" description={desc} />
      <Switch>
        <Route path="/about" component={AboutUs} />
        <Route path="/" component={DogContainer} />
      </Switch>
    </div>
  );
}

export default App;
