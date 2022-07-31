import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import FormStrip from "./FormStrip";
import Select from "react-select";
import axios from "../helpers/Axios";
import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import slugify from 'react-slugify';

const ProductDetail = (props) => {
  const urlParams = useParams();
  const [productDetail, setProductDetail] = useState(null);
  const [sellerList, setSellerList] = useState(null);
  const [categoryList, setCategoryList] = useState(null);
  const [brandList, setBrandList] = useState(null);
  const [taxList, setTaxList] = useState(null);
  const [tagList, setTagList] = useState(null);
  
  const { register, handleSubmit, watch, control, formState: {errors} } = useForm({
    resolver: yupResolver(basicDetailSchema)
  });

  const onBasicDetailSubmit = async (data) => {
    let formData = new FormData();
    let dropdown_arr = ['Seller','Category','Brand','Tax','Tags','Image'];
    Object.keys(data).forEach((item,ind) => {
      if(item === 'Image') {
        formData.append(item, Object.values(data)[ind][0]);
      } else if(dropdown_arr.includes(item)) {
        var sel_val = (Object.values(data)[ind]?.value !== undefined) ? Object.values(data)[ind]?.value : '';
        formData.append(item, sel_val);
      } else {
        formData.append(item, Object.values(data)[ind]);
      }
    });
    const config = {
      headers: {
        'content-type': 'multipart/form-data'
      }
    }
    const response = await axios.post('product-add', formData, config);
  }

  useEffect(() => {
    getProductDetail();
    getSellerList();
    getCategoryList();
    getBrandList();
    getTaxList();
    getTagList();
  }, []);
  
  const getSellerList = async () => {
    const response = await axios.get('seller-dropdown');
    if (response.success === 1) {
      setSellerList(response.data);
    } else {
      setSellerList(null);
    }
  }
  
  const getCategoryList = async () => {
    const response = await axios.get('category-dropdown');
    if (response.success === 1) {
      setCategoryList(response.data);
    } else {
      setCategoryList(null);
    }
  }
  
  const getBrandList = async () => {
    const response = await axios.get('brand-dropdown');
    if (response.success === 1) {
      setBrandList(response.data);
    } else {
      setBrandList(null);
    }
  }
  
  const getTaxList = async () => {
    const response = await axios.get('tax-dropdown');
    if (response.success === 1) {
      setTaxList(response.data);
    } else {
      setTaxList(null);
    }
  }
  
  const getTagList = async () => {
    const response = await axios.get('tag-dropdown');
    if (response.success === 1) {
      setTagList(response.data);
    } else {
      setTagList(null);
    }
  }

  const updateSlug = (string) => {
    const prev_prod_detail = { ...productDetail, Slug: slugify(string) };
    setProductDetail(prev_prod_detail);
  }

  const inputSlug = (string) => {
    const prev_prod_detail = { ...productDetail, Slug: string };
    setProductDetail(prev_prod_detail);
  }

  const handleProductMainImage = (e) => {
    const prev_prod_detail = { ...productDetail, Image: URL.createObjectURL(e.target.files[0]) }
    setProductDetail(prev_prod_detail);
  }

  return (
    <>
      {/* Start content */}
      <div className="content-page">
        <div className="content">
          <div className="container-fluid">
            <FormStrip title="Product Detail" parent_url="/product" parent_title="Product List" page_title="Detail"  />

            <div className="row">
              <div className="col-12">
                <div className="card-box">
                  <div className="row">
                    <div className="col-12">
                      <form onSubmit={handleSubmit(onBasicDetailSubmit)} encType="multipart/form-data" method="post">
                        <input type="hidden" name="ProductId" className="ProductId" value="" />
                        <div className="row">
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Select Seller<span className="text-danger">*</span></label>
                              <Controller
                                {...register("Seller")}
                                control={control}
                                render={({ field }) => (
                                  <Select
                                    {...field}
                                    options={sellerList}
                                  />
                                )}
                              />
                              <p className="error">{errors.Seller?.message}</p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Select Product Category<span className="text-danger">*</span></label>
                              <Controller
                                {...register("Category")}
                                control={control}
                                render={({ field }) => (
                                  <Select
                                    {...field}
                                    options={categoryList}
                                  />
                                )}
                              />
                              <p className="error">{errors.Category?.message}</p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Select Brand<span className="text-danger">*</span></label>
                              <Controller
                                {...register("Brand")}
                                control={control}
                                render={({ field }) => (
                                  <Select
                                    {...field}
                                    options={brandList}
                                  />
                                )}
                              />
                              <p className="error">{errors.Brand?.message}</p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Product Name<span className="text-danger">*</span></label>
                              <input type="text" {...register("ProductName")} value={productDetail?.ProductName} onChange={(e) => updateSlug(e.target.value)} className="form-control" />
                              <p className="error">{errors.ProductName?.message}</p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Slug</label>
                              <input type="text" {...register("Slug")} value={productDetail?.Slug} onBlur={(e) => updateSlug(e.target.value)} onKeyDown={(e) => inputSlug(e.target.value)} className="form-control" />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">SKU</label>
                              <input type="text" {...register("SKU")} value={productDetail?.SKU} className="form-control" />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Product Short Description<span className="text-danger">*</span></label>
                              <textarea {...register("ShortDesc")} className="form-control">{productDetail?.ShortDesc}</textarea>
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-8">
                            <div className="form-group">
                              <label className="control-label">Product Long Description<span className="text-danger">*</span></label>
                              <textarea {...register("LongDesc")} className="form-control">{productDetail?.LongDesc}</textarea>
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Select Tax</label>
                              <Controller
                                {...register("Tax")}
                                control={control}
                                render={({ field }) => (
                                  <Select
                                    {...field}
                                    options={taxList}
                                  />
                                )}
                              />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Regular Price<span className="text-danger">*</span></label>
                              <input type="text" {...register("RegularPrice")} value={productDetail?.RegularPrice} className="form-control" />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Sale Price<span className="text-danger">*</span></label>
                              <input type="text" {...register("SalePrice")} value={productDetail?.SalePrice} className="form-control" />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Select Tags</label>
                              <Controller
                                {...register("Tags")}
                                control={control}
                                render={({ field }) => (
                                  <Select
                                    {...field}
                                    options={tagList}
                                    isMulti
                                    closeMenuOnSelect={false}
                                  />
                                )}
                              />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label">Product Main Image<span className="text-danger">*</span></label>
                              <input type="file" {...register("Image")} id="Image" name="Image" className="filestyle" onChange={(e) => handleProductMainImage(e)} />
                              <p className="error"></p>
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <img id="ImageView" src={productDetail?.Image} className="img-fluid img-thumbnail thumb-lg" width="200" />
                            </div>
                          </div>
                          <div className="col-md-4">
                            <div className="form-group">
                              <label className="control-label"></label>
                              <div className="checkbox">
                                <label className="hand"><input type="checkbox" name="ProductType" id="HaveVariants" value={productDetail?.IsVariable} />Is Variable Product <small>(Have variants in product?)</small></label>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div className="row">
                          <div className="col-md-12">
                            <div className="form-group">
                              <button type="submit" className="btn btn-md btn-success">Save</button>
                              <button type="reset" className="btn btn-md btn-danger">Reset</button>
                            </div>
                          </div>
                        </div>
                      </form>
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

export default ProductDetail;

// Get product detail and set into state
const getProductDetail = () => {
  
}

const basicDetailSchema = yup.object({
  // Seller: yup.object().required(),
  // Category: yup.object().required(),
  // Brand: yup.object().required(),
  // ProductName: yup.string().required().min(2).max(255),
}).required();
