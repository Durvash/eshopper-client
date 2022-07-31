import React from "react";
import { Outlet } from "react-router-dom";
import StyleSheet from "./StyleSheet";
import SideBar from "./SideBar";
import TopBar from "./TopBar";

const ContentLayout = (props) => {
  return <>
    <StyleSheet/>
    <div id="wrapper">
      <TopBar/>
      <SideBar/>
      <Outlet/>
    </div>
  </>;
};

export default ContentLayout;
