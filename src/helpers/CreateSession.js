import axios from "./Axios";

const isValidToken = (accessToken) => {
  if (!accessToken) {
    return false;
  }

  return accessToken;
};

const setSession = (accessToken) => {
  if (accessToken) {
    localStorage.setItem("accessToken", accessToken);
    axios.defaults.headers.common.Authorization = accessToken;
    // console.log(axios.defaults.headers);
  } else {
    localStorage.removeItem("accessToken");
    delete axios.defaults.headers.common.Authorization;
  }
};

export { isValidToken, setSession };
