import React from "react";
import { Navigate } from "react-router-dom";
import Dashboard from "../pages/Dashboard";
import useAuth from "../hooks/useAuth";

const GuestGuard = ({ children }) => {
  const { isAuthenticated } = useAuth();
  // console.log(isAuthenticated);
  if (isAuthenticated) {
    return <Navigate to="/" />;
  }

  return <>{children}</>;
};

export default GuestGuard;
