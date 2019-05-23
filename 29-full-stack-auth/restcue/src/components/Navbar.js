import React from 'react';
import { Link } from 'react-router-dom';

// Class components are used when we need state.
// They must have a render method that returns JSX.
// They store props on the instance `this`.
// The render method DOES NOT TAKE PROPS!

const Navbar = (props) => {
  const menuClasses = `ui inverted ${props.color} menu`
  const iconClasses = `icon ${props.icon}`
  return (
    <div className={menuClasses}>
      <Link to="/" className="item">
        <h2 className="ui header">
          <i className={iconClasses}></i>
          <div className="content">{props.title}</div>
          <div className="sub header">{props.description}</div>
        </h2>
      </Link>
      <Link to="/about" className="item" style={{ color: 'black' }} >
        <div className="content">About Us</div>
      </Link>
    </div>
  )
}

export default Navbar;
