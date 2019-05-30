import React, { Component } from "react";
import ReactDOM from "react-dom";
import "./index.css";
import logo from "./logo.svg";
import "./App.css";
import { createStore } from 'redux';

const initialState = {
  count: 17
};

const rootReducer = (state=initialState, action) => {
  switch (action.type) {
    case "ADD": {
      return { count: state.count + 1 };
    }
    case "SUB": {
      let amount = action.amount || 1;
      return { count: state.count - amount };
    }
    case "MUL": {
      let amount = action.amount || 1;
      return { count: state.count * amount };
    }
    default: return state
  }
};

const theStore = createStore(
  rootReducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);

let App = (props) => {
  return (
    <div className="App">
      <Header />
      <Counter />
    </div>
  );
}


class Header extends Component {
  componentDidMount = () => {
    theStore.subscribe(() => this.forceUpdate())
  }

  renderDescription = () => {
    const remainder = theStore.getState().count % 5;
    const upToNext = 5 - remainder;
    return `The current count is less than ${theStore.getState().count + upToNext}`;
  };

  render() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">Welcome to React</h1>
        <h3>{this.renderDescription()}</h3>
      </header>
    );
  }
}

class Counter extends Component {
  componentDidMount = () =>  {
    theStore.subscribe(() => this.forceUpdate())
  }

  render() {
    return (
      <div className="Counter">
        <h1>{theStore.getState().count}</h1>
        <button onClick={() => theStore.dispatch({ type: "SUB", amount: 5 }) }>- 5</button>
        <button onClick={() => theStore.dispatch({ type: "SUB" })}> - </button>
        <button onClick={() => theStore.dispatch({ type: "ADD" })}> + </button>
        <button onClick={() => theStore.dispatch({ type: "MUL", amount: 2 }) }>* 2</button>
      </div>
    );  
  }
}


ReactDOM.render(<App />, document.getElementById("root"));
