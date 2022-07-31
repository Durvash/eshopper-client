import axios, { post } from "axios";
import { HOST_API } from "../config";

const axiosInstance = axios.create({
  baseURL: HOST_API,
  headers: {
    "Content-type": "application/json"
  }
});

axiosInstance.interceptors.response.use(
  (response) => response.data,
  (error) =>
    Promise.reject(
      (error.response && error.response.data) || "Something went wrong"
    )
);

export default axiosInstance;
