import React from 'react';
import DogListItem from './DogListItem';
import { Link } from 'react-router-dom';

const showIfLoggedIn = (component) => {
  if (localStorage.getItem("token")) {
    return component;
  } else {
    return null;
  }
}

const DogList = (props) => {
  console.log("dog list", props)
  // TODO: add click handler for the new dog item
  return (
    <div className={`${props.width} wide column`}>
      <div className="ui huge divided animated list">
        {props.dogs.map(x => <DogListItem dog={x} selectDog={props.selectDog} />)}
        {
          showIfLoggedIn(
            <Link to="/dogs/new" className="item">
              <div className="content">
                <a class="header">
                  <i class="plus circle icon teal"></i>
                  New Dog
                </a>
              </div>
            </Link>
          )
        }
      </div>
    </div>
  )
}

export default DogList;
