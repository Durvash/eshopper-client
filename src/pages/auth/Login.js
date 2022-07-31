import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup';
import * as yup from "yup";
import useAuth from "../../hooks/useAuth";

const schema = yup.object({
  username: yup.string().required(),
  password: yup.string().required()
})

const Login = () => {
  
  const { login } = useAuth();

  const { register, handleSubmit } = useForm({
    resolver: yupResolver(schema)
  });

  const onSubmitLogin = (data) => {
    // console.log(data);
    try {
      login(data.username, data.password);
    } catch (error) {
      console.error(error);
    }
  }
  
  return (
    <>
      <div className="account-pages"></div>
      <div className="clearfix"></div>
      <div className="wrapper-page">
        <div className="card-box">
          <div className="panel-heading">
            <h4 className="text-center"> Sign In</h4>
          </div>

          <div className="p-20">
            <form className="form-horizontal" onSubmit={handleSubmit(onSubmitLogin)}>
              <div className="form-group">
                <div className="col-12">
                  <input
                    className="form-control"
                    type="text"
                    {...register("username")}
                    placeholder="Username"
                  />
                </div>
              </div>

              <div className="form-group">
                <div className="col-12">
                  <input
                    className="form-control"
                    type="password"
                    {...register("password")}
                    placeholder="Password"
                  />
                </div>
              </div>

              <div className="form-group">
                <div className="col-12">
                  <div className="checkbox checkbox-primary">
                    <input type="checkbox" {...register("remember")} id="remember" />
                    <label htmlFor="remember">Remember me</label>
                  </div>
                </div>
              </div>

              <div className="form-group text-center">
                <div className="col-12">
                  <button
                    className="btn btn-pink btn-block text-uppercase waves-effect waves-light"
                    type="submit"
                  >
                    Log In
                  </button>
                </div>
              </div>

              <div className="form-group m-t-30 m-b-0">
                <div className="col-12">
                  <a className="text-dark">
                    <i className="fa fa-lock m-r-5"></i> Forgot your password?
                  </a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </>
  );
};

export default Login;
