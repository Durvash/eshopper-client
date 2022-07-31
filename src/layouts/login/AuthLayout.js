import React from "react";
import { Outlet } from "react-router-dom";
import StyleSheet from "./StyleSheet";

const AuthLayout = (props) => {
  return <>
    <StyleSheet/>
    <div id="wrapper">
      <Outlet/>
    </div>
  </>;
};

export default AuthLayout;
