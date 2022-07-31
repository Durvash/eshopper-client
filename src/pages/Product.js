import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import FormStrip from "./FormStrip";
import axios from "../helpers/Axios";

const Product = () => {
  const [productList, setProductList] = useState(null);

  useEffect(() => {
    getProductList();
  }, []);

  const getProductList = async () => {
    const response = await axios.get('product-list');
    setProductList(response);
  }

  return (
    <>
      {/* Start content */}
      <div className="content-page">
        <div className="content">
          <div className="container-fluid">
            <FormStrip title="Product List" />

            <div className="row">
              <div className="col-12">
                <div className="card-box">
                  <div className="row">
                    <div className="col-12">
                        <Link to="" className="btn btn-success m-l-15"> Add New </Link>
                    </div>
                  </div>
                  <br />
                  <div className="row">
                    <div className="col-12">
                      <div className="port">
                        <div className="row portfolioContainer">
                        {productList?.data ? productList?.data.map((item, ind) => {
                          return ( productBox(item, ind) )
                        }) : <></>}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* container */}
        </div>
      </div>
      {/* end content */}
    </>
  );
};

export default Product;

///// Display Single Product
const productBox = (item, ind) => {
  // console.log(item);
  return (
    <div key={ind} className="col-sm-6 col-lg-3 col-md-4">
      <div className="gal-detail thumb">
        <Link to={"/product-detail/"+item.ProductId} className="image-popup" title="Screenshot-1">
          <img src={require("../layouts/assets/images/gallery/1.jpg")} className="thumb-img" alt="work-thumbnail" />
        </Link>
        <h4 className="font-18 text-ellipsis" title={item?.ProductName}>{item?.ProductName}</h4>
        <p className="font-14 flow-root">
          <span className="float-left">${item?.SalePrice}</span>
          {item?.StockQty > 0 ?
          <span className="label label-danger float-right">Out of stock</span>
          : <span className="label label-success float-right">In stock</span>
          }
        </p>
      </div>
    </div>
  )
}