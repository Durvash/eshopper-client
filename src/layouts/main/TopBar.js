import React, { useState } from "react";
import { Link } from "react-router-dom";
const IMG_URL = process.env.REACT_APP_IMG_URL;

const TopBar = () => {
  const [toggleProfileDropdown, setToggleProfileDropdown] = useState('');
  const handleToogleProfileDropdown = () => {
    (toggleProfileDropdown === '') ? setToggleProfileDropdown('show') : setToggleProfileDropdown('');
  }
  const handleHideProfileDropdown = () => {
    setToggleProfileDropdown('');
  }
  return (
    <>
      {/* Top Bar Start */}
      <div className="topbar">
        {/* LOGO */}
        <div className="topbar-left">
          <div className="text-center">
            {/* Image Logo here */}
            <Link to="/" className="logo">
              <i className="icon-c-logo">
                <img src={IMG_URL + "logo_sm.png"} height="42" />
              </i>
              <span>
                <img src={IMG_URL + "logo_light.png"} height="20" />
              </span>
            </Link>
          </div>
        </div>

        {/* Button mobile view to collapse sidebar menu */}
        <nav className="navbar-custom">
          <ul className="list-inline float-right mb-0">
            <li className="list-inline-item notification-list">
              <Link to="" className="nav-link waves-light waves-effect" id="btn-fullscreen">
                <i className="dripicons-expand noti-icon"></i>
              </Link>
            </li>

            <li className={"list-inline-item dropdown notification-list "+toggleProfileDropdown}>
              <Link className="nav-link dropdown-toggle waves-effect waves-light nav-user" onClick={handleToogleProfileDropdown} onBlur={handleHideProfileDropdown} data-toggle="dropdown" to="" role="button" aria-haspopup="false" aria-expanded="false">
                <img src={IMG_URL + "avatar.jpg"} alt="user" className="rounded-circle" />
              </Link>
              <div className="dropdown-menu dropdown-menu-right profile-dropdown " aria-labelledby="Preview">
                <div className="dropdown-item noti-title">
                  <h5 className="text-overflow">
                    <small>Welcome! User</small>
                  </h5>
                </div>

                <Link to="" className="dropdown-item notify-item">
                  <i className="md md-account-circle"></i> <span>Profile</span>
                </Link>

                <Link to="" className="dropdown-item notify-item">
                  <i className="md md-settings-power"></i> <span>Logout</span>
                </Link>
              </div>
            </li>
          </ul>

          <ul className="list-inline menu-left mb-0">
            <li className="float-left">
              <button className="button-menu-mobile open-left waves-light waves-effect">
                <i className="dripicons-menu"></i>
              </button>
            </li>
          </ul>
        </nav>
      </div>
      {/* Top Bar End */}
    </>
  );
};

export default TopBar;
