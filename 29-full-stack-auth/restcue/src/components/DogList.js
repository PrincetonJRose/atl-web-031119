import React from 'react';
import DogListItem from './DogListItem';
import { Link } from 'react-router-dom';

const DogList = (props) => {
  console.log("dog list", props)
  // TODO: add click handler for the new dog item
  return (
    <div className={`${props.width} wide column`}>
      <div className="ui huge divided animated list">
        {props.dogs.map(x => <DogListItem dog={x} selectDog={props.selectDog} />)}
        <Link to="/dogs/new" className="item">
          <div className="content">
            <a class="header">
              <i class="plus circle icon teal"></i>
              New Dog
            </a>
          </div>
        </Link>
      </div>
    </div>
  )
}

export default DogList;
