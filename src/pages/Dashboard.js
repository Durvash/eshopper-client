import React from "react";
import FormStrip from "./FormStrip";

const Dashboard = () => {
  return (
    <>
      {/* Start content */}
      <div className="content-page">
        <div className="content">
          <div className="container-fluid">
            <FormStrip title="Dashboard" title_desc="Welcome to Meraya admin panel !" />
          </div>
          {/* container */}
        </div>
      </div>
      {/* end content */}
    </>
  );
};

export default Dashboard;
