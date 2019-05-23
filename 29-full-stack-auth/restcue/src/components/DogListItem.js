import React from 'react';
import { Link } from 'react-router-dom';

const DogListItem = (props) => {
  return (
    <Link to={`/dogs/${props.dog.id}`} className="item">
      <img className="ui avatar image" src={props.dog.image_url} />
      <div className="content">
        <a className="header">{props.dog.name}</a>
      </div>
    </Link>
  )
}

export default DogListItem;
