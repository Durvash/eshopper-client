import React from "react";
import { Link } from "react-router-dom";

const FormStrip = (props) => {
  // console.log(props);
  return (
    <>
      <div className="row">
        <div className="col-sm-12 p-b-10">
          <div className="page-title-box">
            <div className="btn-group pull-right">
              <ol className="breadcrumb hide-phone p-0 m-0">
                {props?.parent_url ? (
                  <li className="breadcrumb-item">
                    <Link to={props.parent_url}>{props?.parent_title}</Link>
                  </li>
                ) : (
                  ""
                )}
                {props?.page_title ? (
                  <li className="breadcrumb-item active">
                    {props?.page_title}
                  </li>
                ) : (
                  ""
                )}
              </ol>
            </div>
            <h4 className="page-title">{props?.title}</h4>
            {props?.title_desc ? (
              <p className="text-muted page-title-alt">{props?.title_desc}</p>
            ) : (
              ""
            )}
          </div>
        </div>
      </div>
    </>
  );
};

export default FormStrip;
